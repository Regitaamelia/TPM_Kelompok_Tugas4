import 'package:flutter/material.dart';
import 'dart:async';

class MenuStopwatch extends StatefulWidget {
  @override
  _MenuStopwatchState createState() => _MenuStopwatchState();
}

class _MenuStopwatchState extends State<MenuStopwatch> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  bool _isRunning = false;

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        setState(() {});
      });
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
      _timer.cancel();
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _isRunning = false;
      _timer.cancel();
      _stopwatch.reset();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _stopwatch.elapsed.inMinutes.toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
        '.' +
        (_stopwatch.elapsed.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Color(0xffDAF5FF),
      appBar: AppBar(
        title: Text('Menu Stopwatch'),
        backgroundColor: Color(0xff19376D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedTime,
              style: TextStyle(fontSize: 64.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _isRunning ? _stopStopwatch : _startStopwatch,
                  child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                ),
                SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: _resetStopwatch,
                  child: Icon(Icons.stop),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}