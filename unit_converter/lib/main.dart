import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String _resultMessage = '';
  final Map<String, int> _measureMap = {
    'meter': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };

  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

  void convert(double value, String from, String to) {
    int nFrom = _measureMap[from] as int;
    int nTo = _measureMap[to] as int;
    var multiplier = _formulas[nFrom.toString()][nTo];
    setState(() {
      _resultMessage = (value * multiplier).toString();
    });
  }

  String _startMeasure = 'meters';
  String _convertedMeasure = 'meters';
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces'
  ];
  late double _numberForm;
  @override
  void initState() {
    _numberForm = 0.1;
    super.initState();
  }

  final TextStyle inputStyle = TextStyle(fontSize: 20, color: Colors.blue[900]);

  final TextStyle labelStyle = TextStyle(fontSize: 24, color: Colors.grey[700]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Measure Converter',
        home: Scaffold(
            appBar: AppBar(title: Text('Measure Converter x')),
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Spacer(),
                  Text('Value', style: labelStyle),
                  TextField(
                      style: inputStyle,
                      decoration: InputDecoration(
                          hintText:
                              "Please insert the measure to be converted."),
                      onChanged: (text) {
                        var rv = double.tryParse(text);
                        if (rv != null) {
                          setState(() {
                            _numberForm = rv;
                          });
                        }
                      }),
                  Spacer(),
                  Text('Form', style: labelStyle),
                  DropdownButton(
                      isExpanded: true,
                      value: _startMeasure,
                      items: _measures
                          .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                              )))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _startMeasure = value.toString();
                        });
                      }),
                  Spacer(),
                  Text(
                    'To',
                    style: labelStyle,
                  ),
                  DropdownButton(
                      isExpanded: true,
                      value: _convertedMeasure,
                      items: _measures
                          .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                              )))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _convertedMeasure = value.toString();
                        });
                      }),
                  Spacer(flex: 2),
                  RaisedButton(
                    child: Text('Convert', style: inputStyle),
                    onPressed: () =>
                        convert(_numberForm, _startMeasure, _convertedMeasure),
                  ),
                  Spacer(flex: 2),
                  Text(_resultMessage, style: labelStyle),
                ]))));
  }
}
