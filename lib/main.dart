import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_poc/theme.dart';
import 'package:flutter_poc/songs.dart';

void main() {
  runApp(new MyApp());
}

// TODO: https://www.youtube.com/watch?v=FE7Vtzq52xg => 11:54

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter PoC',
      debugShowCheckedModeBanner: false,
      home: new MyHomePAge(),
    );
  }
}

class MyHomePAge extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePAge> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            color: const Color(0xFFDDDDDD),
            onPressed: () {}),
        title: new Text(''),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              color: const Color(0xFFDDDDDD),
              onPressed: () {})
        ],
      ),
      body: new Column(
        children: <Widget>[
          // Seek bar
          new Expanded(
            child: new Center(
              child: new Container(
                height: 125.0,
                width: 125.0,
                child: new ClipOval(
                  clipper: new CircleClipper(),
                  child: Image.network(
                    demoPlaylist.songs[0].albumArtUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Visualizer
          new Container(
            width: double.infinity,
            height: 125.0,
          ),

          // Song titile, artist name etc.
          new BottomControls(),
        ],
      ),
    ));
  }
}

class BottomControls extends StatelessWidget {
  const BottomControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new Material(
        color: accentColor,
        child: new Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
          child: new Column(
            children: <Widget>[
              new RichText(
                text: new TextSpan(text: '', children: [
                  new TextSpan(
                      text: 'Song Title \n',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4.0,
                        height: 1.5,
                      )),
                  new TextSpan(
                      text: 'Artist Name',
                      style: new TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 12.0,
                        letterSpacing: 3.0,
                        height: 1.5,
                      ))
                ]),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(),
                  ),
                  new PreviousButton(),
                  new Expanded(
                    child: new Container(),
                  ),
                  new PlayPauseButton(),
                  new Expanded(
                    child: new Container(),
                  ),
                  new NextButton(),
                  new Expanded(
                    child: new Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      icon: new Icon(
        Icons.skip_previous,
        color: Colors.white,
        size: 35.0,
      ),
      onPressed: () {
        // TODO: to be implementted
      },
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      shape: new CircleBorder(),
      fillColor: Colors.white,
      splashColor: lightAccentColor,
      highlightColor: lightAccentColor.withOpacity(0.5),
      elevation: 10.0,
      highlightElevation: 5.0,
      onPressed: () {
        //TODO:
      },
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Icon(
          Icons.play_arrow,
          color: darkAccentColor,
          size: 35.0,
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      icon: new Icon(
        Icons.skip_next,
        color: Colors.white,
        size: 35.0,
      ),
      onPressed: () {
        // TODO: to be implementted
      },
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
      center: new Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
