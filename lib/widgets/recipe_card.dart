import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/styles.dart';

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
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildDetails(),
        ),
      ],
    );
  }
}
