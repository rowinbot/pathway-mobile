import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pathway_mobile/models/match/match_player.dart';

class GameTimer extends StatefulWidget {
  final int turnStartTime;
  final int turnTimeLimitSeconds;
  final bool isCurrentPlayerTurn;
  final MatchPlayer? currentTurnPlayer;

  const GameTimer({
    super.key,
    required this.turnStartTime,
    required this.turnTimeLimitSeconds,
    required this.isCurrentPlayerTurn,
    required this.currentTurnPlayer,
  });

  @override
  State<GameTimer> createState() => _GameTimerState();
}

class _GameTimerState extends State<GameTimer> {
  late final Timer periodicTimer;
  int secondsLeft = 0;

  String get minutesLeftDisplay =>
      (secondsLeft ~/ 60).toString().padLeft(2, '0');
  String get secondsLeftDisplay =>
      (secondsLeft % 60).toString().padLeft(2, '0');

  @override
  void initState() {
    super.initState();

    timerTick();

    periodicTimer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
      timerTick();
    });
  }

  int deltaWithNow() {
    var timestamp = DateTime.now().millisecondsSinceEpoch;
    var delta = (timestamp - widget.turnStartTime) ~/ 1000;

    if (delta < 0) {
      return 0;
    } else {
      return delta;
    }
  }

  void timerTick() {
    setState(() {
      secondsLeft = widget.turnTimeLimitSeconds - deltaWithNow();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          painter: TimerCountdownClockPainter(
            turnStartTime: widget.turnStartTime,
            turnTimeLimitSeconds: widget.turnTimeLimitSeconds,
          ),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                secondsLeftDisplay.substring(0, 2),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        if (widget.isCurrentPlayerTurn)
          const Text(
            'Your turn!',
            style: TextStyle(
              fontSize: 24,
            ),
          )
        else if (widget.currentTurnPlayer != null)
          Text(
            widget.currentTurnPlayer!.nickname,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    periodicTimer.cancel();
    super.dispose();
  }
}

class TimerCountdownClockPainter extends CustomPainter {
  final int turnStartTime;
  final int turnTimeLimitSeconds;

  TimerCountdownClockPainter({
    required this.turnStartTime,
    required this.turnTimeLimitSeconds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var innerRadius = 3.0;
    var outerRadius = 3.0;

    var paint = Paint()
      ..color = Colors.deepPurple.shade100
      ..strokeWidth = innerRadius
      ..style = PaintingStyle.stroke;

    var center = Offset(size.width / 2, size.height / 2);
    var radius = size.width / 2;

    var timestamp = DateTime.now().millisecondsSinceEpoch;
    var delta = (timestamp - turnStartTime) ~/ 1000;
    var percent = delta / turnTimeLimitSeconds - 1;

    paint
      ..color = Colors.white.withAlpha(100)
      ..style = PaintingStyle.fill;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      pi * 2 * percent,
      true,
      paint,
    );

    paint
      ..color = Colors.deepPurple.shade100
      ..strokeWidth = innerRadius
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius - outerRadius, paint);

    paint
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerRadius;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );

    paint
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerRadius;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
