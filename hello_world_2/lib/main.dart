import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.deepPurple, fontFamily: "Ponderosa"),
      home: MyHomePage(title: 'INTO THE VOID'),
    );
  }
}

class MyCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CUSTOMIZE"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('GO BACK!'),
        ),
      ),
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
  String _text = '';

  int score = 0;

  int level = 0;

  void onChanged(String value) {
    setState(() {
      _text = value;
    });
  }

  void _dialogB(){
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Color.fromRGBO(103, 58, 183, 50),
          title: new Text("The Void Answers"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onPressed() {
    _text = _controller.text;
    if (_text.compareTo("wo mei you peng you") == 0) {
      score = 51200;
      level = 10;
    } else {
      score += _text.length;
      if (score >= (50 * pow(2, level))) {
        level++;
        score = 0;
      }
    }

    print(_text);
    _controller.clear();
  }

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: "ponderosa"),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/banana.gif"),
              height: 50,
              width: 50,
            ),
            Container(
              width: 400,
              child: TextField(
                decoration: new InputDecoration(
                  hintText: "Scream here",
                  hintStyle:
                      TextStyle(color: Colors.grey, fontFamily: "ponderosa"),
                  //fillColor: Colors.green,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
                maxLines: 5,
                onChanged: (String value) {
                  onChanged(value);
                },
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 300,
              height: 100,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.grey,
                ),
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.grey),
                  highlightedBorderColor: Colors.white,
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    onPressed();
                    _dialogB();
                  },
                  child: Text(
                    'SCREAM',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[900],
          child: Column(
            children: <Widget>[
              Container(
                child: DrawerHeader(
                  child: Container(
                    child: Text(
                      "Level " + level.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(20.0),
                  ),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[500],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'SHOP',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCustom(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
