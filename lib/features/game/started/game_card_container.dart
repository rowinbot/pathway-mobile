import 'package:flutter/material.dart';

class GameCardContainer extends StatelessWidget {
  final List<Widget> children;
  final bool disabled;
  final bool highlightBorder;
  final void Function()? onTap;

  const GameCardContainer({
    super.key,
    required this.children,
    required this.disabled,
    required this.highlightBorder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 37,
        minHeight: 50,
      ),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black.withAlpha(50),
            width: highlightBorder ? 2 : 0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onTap,
          overlayColor: MaterialStateProperty.all(Colors.blue.withAlpha(25)),
          borderRadius: BorderRadius.circular(8),
          mouseCursor: disabled
              ? SystemMouseCursors.forbidden
              : MaterialStateMouseCursor.clickable,
          child: Stack(
            fit: StackFit.passthrough,
            children: children,
          ),
        ),
      ),
    );
  }
}
