import 'package:calc_app/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    '*',
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
    '*',
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

  final userqn = '';
  final userans = '';

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
                    fontSize: 30,
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
                  if (index == 0) {
                    return MyButton(
                        txtcolor: Colors.white,
                        btntxt: buttons[index],
                        btncolor: Colors.green);
                  }
                  if (index == 1) {
                    return MyButton(
                        txtcolor: Colors.white,
                        btntxt: buttons[index],
                        btncolor: Colors.red);
                  }
                  return MyButton(
                      txtcolor: isOp(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                      btntxt: buttons[index],
                      btncolor: isOp(buttons[index])
                          ? Colors.deepPurple
                          : Colors.white);
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
}
