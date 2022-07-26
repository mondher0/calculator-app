import 'package:flutter/material.dart';

class calculatorhome extends StatefulWidget {
  const calculatorhome({Key? key}) : super(key: key);

  @override
  State<calculatorhome> createState() => _calculatorhomeState();
}

class _calculatorhomeState extends State<calculatorhome> {
  String result = '';
  String finalresult = '';
  double num1 = 0;
  double num2 = 0;
  String opr = '';

  buttonrpressed(String buttonval) {
    if (buttonval == 'AC') {
      finalresult = '0';
      num1 = 0;
      num2 = 0;
      opr = '';
    } else if (buttonval == '+' ||
        buttonval == '-' ||
        buttonval == '/' ||
        buttonval == 'X') {
      num1 = double.parse(result);
      finalresult = '0';
      opr = buttonval;
      result = result + buttonval;
    } else if (buttonval == '.') {
      if (buttonval.contains('.')) {
      } else {
        finalresult = finalresult + buttonval;
      }
    } else if (buttonval == '+/-') {
      if (result.toString().contains('-')) {
        result.toString().substring(1);
        finalresult = result;
      } else {
        result = '-' + result;
      }
    } else if (buttonval == '%') {
      num2 = double.parse(result);
      finalresult = (num2 / 100).toString();
    } else if (buttonval == '=') {
      num2 = double.parse(result);
      if (opr == '+') {
        finalresult = (num1 + num2).toString();
      }
      if (opr == '-') {
        finalresult = (num1 - num2).toString();
      }
      if (opr == 'X') {
        finalresult = (num1 * num2).toString();
      }
      if (opr == '/') {
        finalresult = (num1 / num2).toString();
      }
    } else {
      finalresult = finalresult + buttonval;
    }
    setState(() {
      result = finalresult;
    });
  }

  Widget button(String txtbutton, Color txtcolor, Color bg) {
    if (txtbutton == '0') {
      return Container(
        child: RawMaterialButton(
          shape: StadiumBorder(),
          fillColor: bg,
          onPressed: () {
            buttonrpressed(txtbutton);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
            child: Text(
              txtbutton,
              style: TextStyle(fontSize: 25, color: txtcolor),
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: RawMaterialButton(
          shape: CircleBorder(),
          fillColor: bg,
          onPressed: () {
            buttonrpressed(txtbutton);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              txtbutton,
              style: TextStyle(fontSize: 25, color: txtcolor),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcuator'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  finalresult,
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 130,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              button('AC', Colors.white, Colors.blue),
              button('+/-', Colors.white, Colors.blue),
              button('%', Colors.white, Colors.blue),
              button('/', Colors.blue, Colors.white),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              button('7', Colors.white, Colors.blue),
              button('8', Colors.white, Colors.blue),
              button('9', Colors.white, Colors.blue),
              button('X', Colors.blue, Colors.white),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              button('4', Colors.white, Colors.blue),
              button('5', Colors.white, Colors.blue),
              button('6', Colors.white, Colors.blue),
              button('-', Colors.blue, Colors.white),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              button('1', Colors.white, Colors.blue),
              button('2', Colors.white, Colors.blue),
              button('3', Colors.white, Colors.blue),
              button('+', Colors.blue, Colors.white),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              button('0', Colors.white, Colors.blue),
              button('.', Colors.white, Colors.blue),
              button('=', Colors.blue, Colors.white),
            ],
          ),
        ]),
      ),
    );
  }
}
