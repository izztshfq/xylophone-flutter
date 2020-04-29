import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Widget buildKey({String text, int note, Color color, double width}) {
    return SizedBox(
      height: 100,
      width: width * 5,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.brightness_1, size: 40, color: Colors.white),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(Icons.brightness_1, size: 35, color: Colors.white)
          ],
        ),
        color: color,
        onPressed: () {
          playSound(note);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Text(
            'Classic Xylophone',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildKey(
                    text: "C", note: 1, color: Colors.red[400], width: 100),
                buildKey(
                    text: "D", note: 2, color: Colors.orange[400], width: 80),
                buildKey(
                    text: "E", note: 3, color: Colors.yellow[600], width: 75),
                buildKey(
                    text: "F", note: 4, color: Colors.green[400], width: 70),
                buildKey(
                    text: "G", note: 5, color: Colors.teal[400], width: 65),
                buildKey(
                    text: "A", note: 6, color: Colors.blue[400], width: 60),
                buildKey(
                    text: "B", note: 7, color: Colors.purple[400], width: 50),
              ]),
        ),
      ),
    );
  }
}
