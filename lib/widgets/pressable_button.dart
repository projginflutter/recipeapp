import 'dart:ui';
import 'package:flutter/material.dart';

class PressableButton extends StatefulWidget {
  const PressableButton({
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.duration = const Duration(milliseconds: 10),
    this.onPressed,
    this.buttonImgPath,
    this.buttonImgPathDown,
    Key key,
  })  : assert(borderRadius != null),
        assert(duration != null),
        assert(buttonImgPath != null),
        assert(buttonImgPathDown != null),
        super(key: key);

  final VoidCallback onPressed;

  final BorderRadius borderRadius;

  final Duration duration;

  final String buttonImgPath;

  final String buttonImgPathDown;

  @override
  _PressableButtonState createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  bool buttonIsDown = true;
  String bpath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (buttonIsDown) {
      bpath = widget.buttonImgPathDown;
    } else {
      bpath = widget.buttonImgPath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (buttonIsDown) {
            buttonIsDown = false;
            bpath = widget.buttonImgPathDown;
          } else {
            buttonIsDown = true;
            bpath = widget.buttonImgPath;
          }
        });
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      //onTapDown: (details) => setState(() => buttonIsDown ? buttonIsDown=false:buttonIsDown=true),
      //onTapCancel: () => setState(() => buttonIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: 5.0,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: Colors.transparent,
        duration: widget.duration,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: null,
                image: AssetImage(
                  bpath,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
