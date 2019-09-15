import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
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

String sprite = "";
String sprite1 = "images/image07.gif", sprite2 = "images/image07.gif", sprite3 = "images/image07.gif",
    sprite4 = "images/image07.gif", sprite5 = "images/image07.gif", sprite6 = "images/image07.gif";

class MyCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _changeSpriteOne(){
      if (level >= 1){
        sprite = "images/image01.gif";
        sprite1 = "images/image01.gif";
      }
    }

    void _changeSpriteTwo(){
      if (level >= 2) {
        sprite = "images/image02.gif";
        sprite2 = "images/image02.gif";
      }
    }

    void _changeSpriteThree(){
      if (level >= 3) {
        sprite = "images/image03.gif";
        sprite3 = "images/image03.gif";
      }
    }

    void _changeSpriteFour(){
      if (level >= 4) {
        sprite = "images/image04.gif";
        sprite4 = "images/image04.gif";
      }
    }

    void _changeSpriteFive(){
      if (level >= 5) {
        sprite = "images/image05.gif";
        sprite5 = "images/image05.gif";
      }
    }

    void _changeSpriteSix(){
      if (level >= 6) {
        sprite = "images/image06.gif";
        sprite6 = "images/image06.gif";
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CUSTOMIZE"),
      ),
      body: Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                    width: 100.0,
                    height: 100.0,
                    child: FlatButton(
                        onPressed: _changeSpriteOne,
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(sprite1)),

                  ),
                  new Container(
                    width: 100.0,
                    height: 100.0,
                    child: FlatButton(
                        onPressed: _changeSpriteTwo,
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(sprite2)),
                  ),
                  new Container(
                    width: 100.0,
                    height: 100.0,
                    child: FlatButton(
                        onPressed: _changeSpriteThree,
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(sprite3)),
                  ),
                ]
              ),

              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      width: 100.0,
                      height: 100.0,
                      child: FlatButton(
                          onPressed: _changeSpriteFour,
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(sprite4)),

                    ),
                    new Container(
                      width: 100.0,
                      height: 100.0,
                      child: FlatButton(
                          onPressed: _changeSpriteFive,
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(sprite5)),
                    ),
                    new Container(
                      width: 100.0,
                      height: 100.0,
                      child: FlatButton(
                          onPressed: _changeSpriteSix,
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(sprite6)),
                    ),
                  ]
              ),

            ],
          )
      ),
    );
  }


}

int level = 0;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AssetsAudioPlayer _assetsAudioPlayer;


  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(
      AssetsAudio(
        asset: "longmii.mp3",
        folder: "assets/",
      ),
    );
    _assetsAudioPlayer.play();
  }


  String _text = '';

  int score = 0;



  int levelCap = 50;

  int temp;

  double progress;

  void onChanged(String value) {
    setState(() {
      _text = value;
    });
  }

  int gifIndex(int level){
    if(level < 6){
      return level;
    }
    else{
      return 6;
    }
  }

  void _dialogB(){
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Color.fromRGBO(103, 58, 183, 50),
          title: new Text("The Void Answers",
              style: TextStyle(
                color: Colors.white,
              ),

          ),
          content: new Text("You have been heard.",
            style: TextStyle(
              color: Colors.white,
            ),

          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _dialogLevel(){
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.deepOrange,
          title: new Text("Level Up!",
            style: TextStyle(
              color: Colors.white,
            ),

          ),
          content: new Text("You are now level $level",
            style: TextStyle(
              color: Colors.white,
            ),

          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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


    setState(() {
      levelCap = 50 * pow(2, level);
    });

    if (_text.compareTo("wo mei you peng you") == 0) {
      score = 51200;
      level = 10;
    } else {
      setState(() {
        score += _text.length;
      });
    }

    if (score >= levelCap) {

      temp = score - levelCap;
      score = temp;
      setState(() {
        level++;
        levelCap = 50 * pow(2, level);

      });
      _dialogLevel();

  }

    _assetsAudioPlayer.play();
    _controller.clear();
  }

  double findProgress(){
    progress = score/levelCap;
    return progress;
  }

  int findScore(){
    return score;
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
                    child: Column(

                      children: <Widget>[
                        new Image(

                          image: new AssetImage(sprite),
                          height: 50,
                          width: 50,
                        ),


                        Padding(
                          padding: EdgeInsets.all(5),
                        ),

                        Text(
                          "Level " + level.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(5),
                        ),

                        LinearProgressIndicator(

                          value: findProgress(),
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),

                        ),

                        Padding(
                          padding: EdgeInsets.all(5),
                        ),

                        Text(
                          score.toString() + "/" + levelCap.toString() + "EXP",
                          style: TextStyle(
                            color: Colors.greenAccent,
                          ),
                        ),


                      ],

                    ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(20.0),
                  ),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(108, 58, 181, 1),
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
