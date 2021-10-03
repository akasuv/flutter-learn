import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My first flutter",
        home: Scaffold(
            appBar: AppBar(
                title: Text('My first flutter'),
                backgroundColor: Colors.deepOrange),
            body: Builder(
                builder: (context) => SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                            child: Column(children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Hello Dartttttttt',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800])),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Discover the world',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepOrangeAccent)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.network(
                                'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
                                height: 300),
                          ),
                          Padding(
                              padding: EdgeInsets.all(15),
                              child: ElevatedButton(
                                  child: Text('Click me!'),
                                  onPressed: () => contactUs(context)))
                        ])))))));
  }

  void contactUs(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Contact Us'),
              content: Text('Hey its on me in my head'),
              actions: <Widget>[
                FlatButton(
                    child: Text('close'),
                    onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }
}
