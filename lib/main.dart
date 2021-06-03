import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dialog Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 190,
              child: ElevatedButton(
                child: const Text('AlertDialog'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("This is the title"),
                        content: Text("This is the content"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () => print('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 190,
              child: ElevatedButton(
                child: const Text('SimpleDialog'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("This is the title"),
                        children: [
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context),
                            child: Text("first item"),
                          ),
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context),
                            child: Text("second item"),
                          ),
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Third item"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 190,
              child: ElevatedButton(
                child: const Text('CupertinoAlertDialog'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                            title: Text("This is the title"),
                            content: Text("This is the content"),
                            actions: [
                              CupertinoDialogAction(
                                  child: Text('Cancel'),
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                              CupertinoDialogAction(
                                child: Text('OK'),
                                onPressed: () {
                                  print('OK');
                                },
                              )
                            ],
                          ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
