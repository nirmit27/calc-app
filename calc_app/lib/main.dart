import 'package:calc_app/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> ops = [
    '=',
    '/',
    'x',
    '-',
    '+',
    '%',
  ];
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '+/-',
    '0',
    '.',
    '='
  ];

  var userqn = '';
  var userans = '';
  var plusminus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  userqn,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  userans,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return MyButton(
                      btntapped: () {
                        setState(() {
                          userqn = '';
                          userans = '';
                        });
                      },
                      txtcolor: Colors.white,
                      btntxt: buttons[index],
                      btncolor: Colors.green,
                    );
                  }
                  // Delete Button
                  if (index == 1) {
                    return MyButton(
                      btntapped: () {
                        setState(() {
                          if (userqn.isNotEmpty) {
                            userqn = userqn.substring(0, (userqn.length - 1));
                          } else {
                            userqn = userqn;
                          }
                        });
                      },
                      txtcolor: Colors.white,
                      btntxt: buttons[index],
                      btncolor: Colors.red,
                    );
                  }
                  // Positive/Negative
                  if (index == (buttons.length - 4)) {
                    return MyButton(
                      btntapped: () {
                        if (userqn.isEmpty ||
                            ops.contains(userqn[userqn.length - 1])) {
                          setState(() {
                            userqn += '-';
                          });
                        }
                      },
                      txtcolor: Colors.white,
                      btntxt: buttons[index],
                      btncolor: Colors.deepPurple,
                    );
                  }
                  // Equal/Evalute
                  if (index == buttons.length - 1) {
                    return MyButton(
                      btntapped: () {
                        setState(() {
                          evaluate();
                        });
                      },
                      txtcolor: Colors.white,
                      btntxt: buttons[index],
                      btncolor: Colors.deepPurple,
                    );
                  }
                  // Remaining Buttons
                  return MyButton(
                    btntapped: () {
                      setState(() {
                        userqn += buttons[index];
                      });
                    },
                    txtcolor:
                        isOp(buttons[index]) ? Colors.white : Colors.deepPurple,
                    btntxt: buttons[index],
                    btncolor:
                        isOp(buttons[index]) ? Colors.deepPurple : Colors.white,
                  );
                }),
          ),
          // child: ,
        ),
      ]),
    );
  }

  bool isOp(String x) {
    if (ops.contains(x)) {
      return true;
    } else {
      return false;
    }
  }

  // Math Expression Parser and Logic
  void evaluate() {
    bool flag = false;

    String finalUserQn = userqn;
    finalUserQn = finalUserQn.replaceAll('x', '*');

    // Checking for type
    if (finalUserQn.contains('.')) {
      flag = true;
    }

    Parser p = Parser();
    Expression exp = p.parse(finalUserQn);
    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);

    if (flag) {
      userans = eval.toStringAsFixed(6);
    } else {
      userans = eval.toStringAsFixed(0);
    }
  }
}
