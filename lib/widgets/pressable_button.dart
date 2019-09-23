import 'dart:ui';
import 'package:flutter/material.dart';

class PressableButton extends StatefulWidget {
  const PressableButton({
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.duration = const Duration(milliseconds: 10),
    this.onPressedDown,
    this.onRelease,
    this.buttonImgPath,
    this.buttonImgPathDown,
    this.isSelected,
    Key key,
  })  : assert(borderRadius != null),
        assert(duration != null),
        assert(buttonImgPath != null),
        assert(buttonImgPathDown != null),
        super(key: key);

  final VoidCallback onPressedDown;

  final VoidCallback onRelease;

  final BorderRadius borderRadius;

  final Duration duration;

  final String buttonImgPath;

  final String buttonImgPathDown;

  final bool isSelected;

  @override
  _PressableButtonState createState() => _PressableButtonState(!isSelected,(!isSelected)?buttonImgPathDown:buttonImgPath);
}

class _PressableButtonState extends State<PressableButton> {

  bool buttonIsDown;
  String bpath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*if (buttonIsDown) {
      bpath = widget.buttonImgPathDown;
    } else {
      bpath = widget.buttonImgPath;
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (buttonIsDown) {
          buttonIsDown = false;
          bpath = widget.buttonImgPath;
          if (widget.onPressedDown != null) {
            widget.onPressedDown();
          }
        } else {
          print('Tapped');
          buttonIsDown = true;
          bpath = widget.buttonImgPathDown;
          if (widget.onRelease != null) {
            widget.onRelease();
          }
        }
        setState(() {

        });
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

  _PressableButtonState(this.buttonIsDown,this.bpath);
}
