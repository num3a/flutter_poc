import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_poc/theme.dart';

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
        print('Pause button clicked');
      },
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Icon(
          Icons.play_arrow,
          color: Colors.black,
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

