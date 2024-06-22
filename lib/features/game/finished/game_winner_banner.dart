import 'package:flutter/material.dart';

class GameWinnerBanner extends StatelessWidget {
  final int? matchWinner;
  const GameWinnerBanner({
    super.key,
    required this.matchWinner,
  });

  @override
  Widget build(BuildContext context) {
    var text = "GAME OVER";

    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        Text(
          'GAME OVER',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        RetroAnimatedText(
          text: text,
        ),
        // AnimatedTextKit(
        //   animatedTexts: [
        //     RetroAnimatedText(
        //         text: 'Hello World', duration: const Duration(seconds: 1)),
        //     // WavyAnimatedText('Look at the waves'),
        //   ],
        //   isRepeatingAnimation: true,
        // ),
      ]),
    );
  }
}

class RetroAnimatedText extends StatefulWidget {
  final String text;
  final Duration duration = const Duration(milliseconds: 250);

  const RetroAnimatedText({
    super.key,
    required this.text,
  });

  @override
  State<RetroAnimatedText> createState() => _RetroAnimatedTextState();
}

class _RetroAnimatedTextState extends State<RetroAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int roundTrips = 0;

  void onAnimationValueChange() {
    if (_animation.value == 1.0) {
      _controller.reverse();
    } else if (_animation.value == 0) {
      roundTrips++;

      if (roundTrips == 2) {
        pauseAnimation();
      } else {
        _controller.forward();
      }
    }

    setState(() {});
  }

  void pauseAnimation() async {
    roundTrips = 0;
    _controller.stop();
    await Future.delayed(const Duration(seconds: 1));
    _controller.forward();
  }

  void setupAnimation({required bool forward}) {
    if (forward) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurveTween(curve: Curves.elasticInOut).animate(_controller)
      ..addListener(onAnimationValueChange);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: _animation.value * -4,
          left: _animation.value * -4,
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.blue, fontSize: 120),
          ),
        ),
        Positioned(
          top: _animation.value * -4,
          left: _animation.value * 4,
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.red, fontSize: 120),
          ),
        ),
        Text(
          widget.text,
          style: const TextStyle(color: Colors.black, fontSize: 120),
        ),
      ],
    );
  }
}
