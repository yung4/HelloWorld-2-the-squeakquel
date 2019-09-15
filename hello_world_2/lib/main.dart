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
      home: MyHomePage(title: 'INTO THE VOID'),
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
  String _text = '';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void onChanged(String value){
    setState(() {
      _text = value;
    });
  }

  void onPressed(){
    _text = _controller.text;
    print(_text);
    _controller.clear();
  }

  final TextEditingController _controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        drawer: Drawer(

          child: Container(
            color: Colors.grey[900],
            child: Column(
              children: <Widget>[
                Container(
                  child: DrawerHeader(

//                  child: Stack(
//                    Align(
//                      alignment: Alignment.bottomCenter,
//                      child: ListTile(
//                        title: Text('hello'),
//                        onTap: () {
//                          Navigator.pop(context);
//                        },
//                      ),
//                    ),
//                  ),


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
                  title: Text('hello',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Container(
              width: 400,
              child: TextField(
                decoration: new InputDecoration(
                  hintText: "Scream here",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  //fillColor: Colors.green,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,

                onChanged: (String value){
                  onChanged(value);
                },
                controller: _controller,
              ),

            ),

            Container(
              margin: EdgeInsets.only(top: 50),
              width: 200,
              height: 100,
              child: DecoratedBox(
                decoration: ShapeDecoration(shape: StadiumBorder(),
                color: Colors.grey,

                ),
                child: OutlineButton(

                  borderSide: BorderSide(color: Colors.grey),
                  highlightedBorderColor: Colors.white,
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  color: Colors.blue,

                  onPressed: (){
                    onPressed();
                  },

                  child: Text(
                    'scream',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),


                ),
              ),

            ),





          ],


        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
