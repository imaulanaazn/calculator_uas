import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:vibration/vibration.dart';
import 'options_screen.dart';
import 'themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";
  String selectedTheme = 'black';
  bool isDarkMode = false;
  bool isVibrationOn = false;

  List<List<String>> buttonList = [
    [
      "(",
      ")",
      "%",
      "/",
    ],
    [
      "7",
      "8",
      "9",
      "*",
    ],
    [
      "4",
      "5",
      "6",
      "-",
    ],
    [
      "1",
      "2",
      "3",
      "+",
    ],
    [
      ".",
      "0",
      "=",
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? ThemeData.dark() : AppThemes.themes[selectedTheme]!,
      child: Scaffold(
        backgroundColor: isDarkMode
            ? ThemeData.dark().scaffoldBackgroundColor
            : AppThemes.themes[selectedTheme]!.scaffoldBackgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            userInput,
                            style: TextStyle(
                                fontSize: 48,
                                color: isDarkMode
                                    ? ThemeData.dark()
                                        .textTheme
                                        .bodyText1!
                                        .color
                                    : Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            result,
                            style: TextStyle(
                                fontSize: 26,
                                color: isDarkMode
                                    ? ThemeData.dark()
                                        .textTheme
                                        .bodyText1!
                                        .color
                                    : Colors.white30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.gear,
                            size: 30.0,
                            color: isDarkMode
                                ? ThemeData.dark().iconTheme.color
                                : AppThemes
                                    .themes[selectedTheme]!.iconTheme.color),
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            _createRoute(OptionsScreen(
                              isDarkMode: isDarkMode,
                              isVibrationOn: isVibrationOn,
                              selectedTheme: selectedTheme,
                            )),
                          );
                          if (result != null && result is Map) {
                            setState(() {
                              isDarkMode = result['isDarkMode'];
                              isVibrationOn = result['isVibrationOn'];
                              selectedTheme = result['selectedTheme'];
                            });
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_sharp,
                            color: isDarkMode
                                ? ThemeData.dark().iconTheme.color
                                : AppThemes
                                    .themes[selectedTheme]!.iconTheme.color),
                        onPressed: () {
                          handleClearAllButtons();
                        },
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                              icon: Icon(Icons.backspace,
                                  color: isDarkMode
                                      ? ThemeData.dark().iconTheme.color
                                      : AppThemes.themes[selectedTheme]!
                                          .iconTheme.color),
                              onPressed: () {
                                handleBackspaceButtons();
                              },
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: buttonList.map((row) {
                    return Expanded(
                      child: Row(
                        children: row.map((buttonText) {
                          // Check if button should span two columns
                          if (buttonText == "=") {
                            return Expanded(
                              flex: 2, // Span two columns
                              child: CustomButton(
                                text: buttonText,
                                isVibrationOn:
                                    isVibrationOn, // Example variable
                                themeData: isDarkMode
                                    ? ThemeData.dark()
                                    : AppThemes.themes[selectedTheme]!,
                              ),
                            );
                          }
                          return Expanded(
                            child: CustomButton(
                              text: buttonText,
                              isVibrationOn: isVibrationOn, // Example variable
                              themeData: isDarkMode
                                  ? ThemeData.dark()
                                  : AppThemes.themes[selectedTheme]!,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomButton(
      {required String text,
      required bool isVibrationOn,
      required ThemeData themeData}) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: InkWell(
        splashColor: const Color(0xFF1d2630),
        onTap: () {
          setState(() {
            if (isVibrationOn) {
              Vibration.vibrate(duration: 50);
            }
            handleButtons(text);
          });
        },
        child: Ink(
          decoration: BoxDecoration(
            color: getBgColor(text, themeData),
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 1,
                  spreadRadius: 0.2,
                  offset: const Offset(0, 4))
            ],
          ),
          child: Center(
            child: Text(
                text == "*"
                    ? "x"
                    : text == "/"
                        ? "÷"
                        : text,
                style: TextStyle(
                  color: getTextColor(text, themeData),
                  fontSize: 30,
                )),
          ),
        ),
      ),
    );
  }

  Color getTextColor(String text, ThemeData themeData) {
    if (text == "=") {
      return themeData.colorScheme.onSecondary;
    }
    if (["/", "*", "-", "+", "%", "(", ")"].contains(text)) {
      return themeData.colorScheme.onTertiary;
    }
    return themeData.textTheme.bodyText1!.color!;
  }

  Color getBgColor(String text, ThemeData themeData) {
    if (text == "=") {
      return themeData.colorScheme.secondary;
    }
    if (["/", "*", "-", "+", "%", "(", ")"].contains(text)) {
      return themeData.colorScheme.tertiary;
    }
    return themeData.primaryColor;
  }

  handleButtons(String text) {
    if (text == "=") {
      result = calculate();
      userInput = result;
      result = "0";

      if (userInput.endsWith(".0")) {
        userInput = userInput.replaceAll(".0", "");
        result = userInput;
      }
    } else if (text == "%") {
      if (userInput.isNotEmpty) {
        userInput = (double.parse(userInput) / 100).toString();
        result = userInput;
      }
    } else {
      userInput = userInput + text;
      result = evaluateExpression(userInput);
    }
  }

  handleClearAllButtons() {
    setState(() {
      userInput = "";
      result = "0";
    });
  }

  handleBackspaceButtons() {
    setState(() {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        result = evaluateExpression(userInput);
      }
    });
  }

  String evaluateExpression(String input) {
    try {
      var exp = Parser().parse(input);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "please use correct expression";
    }
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }

  Route _createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
