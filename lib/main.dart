import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});
  void playSound(int noteNumber) {
    final player = AudioPlayer();

    player.play(
      AssetSource('note$noteNumber.wav'),
    );
  }

  Expanded buildKey({required Color padColor, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteNumber);
        },
        style: TextButton.styleFrom(
          shape: LinearBorder(),
          backgroundColor: padColor,
        ),
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(padColor: Colors.red, noteNumber: 1),
            buildKey(padColor: Colors.orange, noteNumber: 2),
            buildKey(padColor: Colors.yellow, noteNumber: 3),
            buildKey(padColor: Colors.lightGreenAccent, noteNumber: 4),
            buildKey(padColor: Colors.green, noteNumber: 5),
            buildKey(padColor: Colors.blue, noteNumber: 6),
            buildKey(padColor: Colors.purple, noteNumber: 7),
          ],
        )),
      ),
    );
  }
}
