import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator - Created by Jasen Aprian Putra',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Calculator (Proj: Jasen)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String temp = "0";

  double input1 = 0.0;
  double input2 = 0.0;

  String operand = "";

  double his_input1 = 0.0;
  double his_input2 = 0.0;

  void buttonPressed(String buttonText) {
    if (buttonText == "AC/C") {
      temp = "0";
      input1 = 0.0;
      input2 = 0.0;
      operand = "";
    } else if (buttonText == "÷" ||
        buttonText == "X" ||
        buttonText == "-" ||
        buttonText == "+") {
      input1 = double.parse(output);

      temp = "0";

      operand = buttonText.toString();
    } else if (buttonText == ".") {
      if (temp.contains(".")) {
        return;
      } else {
        temp = temp + buttonText;
      }
    } else if (buttonText == "%") {
      input1 = double.parse(output);

      temp = (input1 / 100).toString();

      // input1 = 0.0;
      // input2 = 0.0;
    } else if (buttonText == "+/-") {
      // temp = double.parse(temp).abs().toString();
      if (temp.contains("-")) {
        temp = double.parse(temp).abs().toString();
      } else {
        temp = "-" + temp.toString();
      }
    } else if (buttonText == "=") {
      input2 = double.parse(output);

      if (operand == "X") {
        temp = (input1 * input2).toString();
      }
      if (operand == "÷") {
        temp = (input1 / input2).toString();
      }
      if (operand == "-") {
        temp = (input1 - input2).toString();
      }
      if (operand == "+") {
        temp = (input1 + input2).toString();
      }

      input1 = 0.0;
      input2 = 0.0;
      operand = "";
    } else {
      temp = temp + buttonText;
    }

    setState(() {
      output = double.parse(temp).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: OutlinedButton(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onPressed: () {
            buttonPressed(buttonText);
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade200),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.all(15),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey.shade200),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 25.0),
              child: Text(
                input1.toString() + operand + input2.toString(),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 25.0),
              child: Text(
                output,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButton("AC/C"),
                        buildButton("+/-"),
                        buildButton("%"),
                        buildButton("÷"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("X"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("-"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("+"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0"),
                        buildButton("00"),
                        buildButton("."),
                        buildButton("="),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
