import 'package:flutter/material.dart';
import 'package:oxygen/theme/color.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerCountDown extends StatefulWidget {
  @override
  _TimerCountDownState createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  final CountdownController _controller = CountdownController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 35,
      decoration: BoxDecoration(
        color: Color(lightThemeColors['primary']),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Countdown(
        controller: _controller,
        seconds: 60,
        build: (_, double time) => Center(
          child: Text(
            time.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        interval: Duration(milliseconds: 1000),
        onFinished: () {
          print('Timer is done!');
        },
      ),
    );
  }
}
