import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:recipeapp/widgets/close_button.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/styles.dart';
import 'package:recipeapp/providers/preferences.dart';
import 'package:recipeapp/providers/user_data.dart';
import 'package:recipeapp/providers/recipes.dart';
import 'package:recipeapp/widgets/step_list.dart';
import 'package:recipeapp/widgets/ingredients.dart';
import 'package:provider/provider.dart';

class ServingInfoChart extends StatelessWidget {
  const ServingInfoChart(this.recipe, this.prefs);

  final Recipe recipe;

  final Preferences prefs;

  // Creates a [Text] widget to display a veggie's "percentage of your daily
  // value of this vitamin" data adjusted for the user's preferred calorie
  // target.
  Widget _buildVitaminText(int standardPercentage, Future<int> targetCalories) {
    return FutureBuilder<int>(
      future: targetCalories,
      builder: (context, snapshot) {
        final target = snapshot?.data ?? 2000;
        final percent = standardPercentage * 2000 ~/ target;

        return Text(
          '$percent% DV',
          textAlign: TextAlign.end,
          style: Styles.detailsServingValueText,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 9,
              bottom: 4,
            ),
            child: Text(
              'Serving info',
              style: Styles.detailsServingHeaderText,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Styles.servingInfoBorderColor),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Serving size:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          recipe.servingSize,
                          textAlign: TextAlign.end,
                          style: Styles.detailsServingValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Calories:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '${recipe.caloriesPerServing} kCal',
                          textAlign: TextAlign.end,
                          style: Styles.detailsServingValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Vitamin A:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: _buildVitaminText(
                          recipe.vitaminAPercentage,
                          prefs.desiredCalories,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Vitamin C:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: _buildVitaminText(
                          recipe.vitaminCPercentage,
                          prefs.desiredCalories,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: FutureBuilder(
                  future: prefs.desiredCalories,
                  builder: (context, snapshot) {
                    return Text(
                      'Percent daily values based on a diet of ' +
                          '${snapshot?.data ?? '2,000'} calories.',
                      style: Styles.detailsServingNoteText,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InfoView extends StatelessWidget {
  final Recipe recipe;

  const InfoView(this.recipe);

  Widget build(BuildContext context) {

    final prefs = Provider.of<Preferences>(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 8),
          Text(
            recipe.name,
            style: Styles.detailsTitleText,
          ),
          SizedBox(height: 8),
          Text(
            recipe.shortDescription,
            style: Styles.detailsDescriptionText,
          ),

          ServingInfoChart(recipe, prefs),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ViewRecipe extends StatefulWidget {

  final Recipe recipe;

  ViewRecipe({this.recipe});

  @override
  _ViewRecipeState createState() => _ViewRecipeState();
}



class _ViewRecipeState extends State<ViewRecipe> {

  int _selectedViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0.0,
              left: (MediaQuery.of(context).size.width / 2) - 125,
              child: Hero(
                  tag: widget.recipe.imageAssetPath,
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.recipe.imageAssetPath.toString()),
                            fit: BoxFit.cover)),
                  ))
          ),
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: ClosexButton(() {
                Navigator.of(context).pop();
              }),
            ),
          ),
          Positioned(
            top: 250,
            left: 5.0,
            child: SizedBox(
              width: 400.0,
              child: Column (
                children:[
                  CupertinoSegmentedControl<int>(
                  padding: EdgeInsets.all(5.0),
                  children: {
                    0: SizedBox(
                        width:200,
                        child:Center(child: Text('Facts & Info.'))
                    ),
                    1: SizedBox(
                      width:200,
                      child:Center(child: Text('Ingredients')),
                    ),
                    2: SizedBox(
                      width:200,
                      child:Center(child: Text('Instructions')),
                    )
                  },
                  groupValue: _selectedViewIndex,
                  onValueChanged: (value) {
                    setState(() => _selectedViewIndex = value);
                  },
                ),
                  _selectedViewIndex == 0
                      ? InfoView(widget.recipe)
                      : (_selectedViewIndex == 1)?IngredientsList(widget.recipe.ingredients):StepsList(widget.recipe.steps)
                ]
              ),
            ),
          ),

        ],
      ),
    );
  }
}
