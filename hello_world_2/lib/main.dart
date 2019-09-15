import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: "Ponderosa"
      ),
      home: MyHomePage(title: 'INTO THE VOID'),
    );
  }
}

class MyCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customize"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
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

  void onPressed() {
    _text = _controller.text;
    print(_text);
    _controller.clear();
    if (_text.compareTo("wo mei you peng you") == 0){
      score = 51200;
      level = 10;
    } else {
      score += _text.length;
    }
    if (score > (50 * pow(2,level))){
      level++;
      score = 0;
    }
  }

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text(
          widget.title,
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400,
              child: TextField(
                decoration: new InputDecoration(
                  hintText: "Scream here",
                  hintStyle:
                      TextStyle(color: Colors.grey),
                  //fillColor: Colors.green,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
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
                      "Level 1",
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
                  'hello',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> MyCustom(),
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
