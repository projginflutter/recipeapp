import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/styles.dart';
import 'package:flutter/material.dart';

/*
Pass the stful card widget to this stateless widget to alter image props
 */
class FrostyBackground extends StatelessWidget {
  const FrostyBackground({
    this.color,
    this.intensity = 2,
    this.child,
  });

  final Color color;
  final double intensity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}

class PressableButton extends StatefulWidget {

  const PressableButton({
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.duration = const Duration(milliseconds: 10),
    this.onPressed,
    Key key,
  })  : assert(borderRadius != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback onPressed;

  final BorderRadius borderRadius;

  final Duration duration;

  @override
  _PressableButtonState createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {

  bool buttonIsDown = true;

  String bpath = 'assets/images/add-48.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (buttonIsDown) {
      bpath = 'assets/images/add-48.png';
    } else  {
      bpath = 'assets/images/checked-48.png';
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        setState(() {
          if (buttonIsDown) {
            buttonIsDown=false;
            bpath = 'assets/images/checked-48.png';

          } else  {
            buttonIsDown=true;
            bpath = 'assets/images/add-48.png';
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
            width:35,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter:null,
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

class PressableCard extends StatefulWidget {

  const PressableCard({
    @required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.upElevation = 2,
    this.downElevation = 0,
    this.duration = const Duration(milliseconds: 100),
    this.onPressed,
    Key key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(upElevation != null),
        assert(downElevation != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Duration duration;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {

  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = false);
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: Colors.transparent,
        duration: widget.duration,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}


class RecipeCard extends StatelessWidget {
  //TODO change this to get model and relevant recipe data
  RecipeCard(this.name, this.description, this.path);

  /// Recipe Name
  final String name;
  //Short description
  final String description;
  //Image Asset Path
  final String path;

  Widget _buildDetails() {

    return FrostyBackground(
      color: Color(0x90ffffff),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              style: Styles.cardTitleText,
            ),
            Text(
              this.description,
              style: Styles.cardDescriptionText,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Semantics(
          label: 'A card background featuring ${this.name}',
          child: PressableCard(
              child: Container(
                height: 250,
                width:250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:null,
                    image: AssetImage(
                      this.path,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                //TODO Navigation for ios & android
                // Navigator.of(context).push<void>(CupertinoPageRoute(
                // builder: (context) => DetailsScreen(veggie.id),
                // fullscreenDialog: true,
                // ));
              }
          )
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildDetails(),
        ),
        Positioned(
          top: 0,
          right: 0,
          child:PressableButton(
            onPressed: () {
              //TODO Include add to cart logic here to maintain item count.
              //Navigator.of(context).push<void>(CupertinoPageRoute(
              //builder: (context) => DetailsScreen(veggie.id),
              //fullscreenDialog: true,
              //));
            }
          ),
        ),
      ],
    );
  }
}
