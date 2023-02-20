import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculator/widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Funcion para borrar todo
  String history = "";
  String expression = "";
  void allClear(String text) {
    setState(() {
      history = "";
      expression = "";
    });
  }

  // Funcion para eliminar solo la expresion matematica
  void clear(String text) {
    setState(() {
      expression = "";
    });
  }

  // Funcion que nos permitira hacer calculos
  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    setState(() {
      history = expression;
      expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  // Funcion para hacer click en los numeros
  void numClick(String text) {
    setState(() {
      expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        backgroundColor: const Color(0xFF448aff),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: GoogleFonts.robotoMono(
                        textStyle:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: (Text(
                    expression,
                    style: GoogleFonts.robotoMono(
                        textStyle: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    )),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    bgcolor: 0xFF00BF45,
                    text: "AC",
                    callback: allClear,
                    textSized: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xffE3303A,
                    text: "C",
                    callback: clear,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "%",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "/",
                    callback: numClick,
                    textSized: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "7",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "8",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "9",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "*",
                    callback: numClick,
                    textSized: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "4",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "5",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "6",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "-",
                    callback: numClick,
                    textSized: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "1",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "2",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "3",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "+",
                    callback: numClick,
                    textSized: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: ".",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "0",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "00",
                    callback: numClick,
                    textSized: 20,
                  ),
                  CalcButton(
                    text: "=",
                    callback: evaluate,
                    textSized: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
