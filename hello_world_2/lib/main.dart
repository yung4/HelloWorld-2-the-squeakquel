import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Ponderosa'
      ),
      home: MyHomePage(title: 'Into the Void'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(

        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: DrawerHeader(
                  child: Center(
                    child: Text(
                      "Level 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[500],
                  ),
                ),
              ),

              ListTile(
                  title: Text('hello'),
                  onTap: () {
                    Navigator.pop(context);
                  },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),

      floatingActionButton: Container(

        width: 300,
        height: 80,
        margin: EdgeInsets.only(bottom: 200),
        child: FloatingActionButton.extended(
          //shape: ,
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          //icon: Icon(Icons.add),
          label: Text(
            'scream',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          backgroundColor: Colors.grey[850],

        ),


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
