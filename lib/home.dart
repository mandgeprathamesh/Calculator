import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var userquestion = '';
  var useranswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userquestion,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(useranswer,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ))),
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: (1 / 1.1)),
                itemBuilder: (BuildContext context, index) {
                  if (index == 0) {
                    return button(
                      buttontapped: () {
                        setState(() {
                          userquestion = '';
                          useranswer = '';
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.green,
                      textcolor: Colors.white,
                    );
                  } else if (index == 1) {
                    return button(
                      buttontapped: () {
                        setState(() {
                          if (userquestion == '') {
                          } else {
                            userquestion = userquestion.substring(
                                0, userquestion.length - 1);
                          }
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.red,
                      textcolor: Colors.white,
                    );
                  } else if (index == buttons.length - 1) {
                    return button(
                      buttontapped: () {
                        setState(() {
                          equalpressed();
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.deepPurple,
                      textcolor: Colors.white,
                    );
                  } else {
                    return button(
                      buttontapped: () {
                        setState(() {
                          userquestion += buttons[index];
                        });
                      },
                      buttontext: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textcolor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == '*' || x == '%' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    final String finalquestion = userquestion;
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    useranswer = eval.toString();
  }
}
