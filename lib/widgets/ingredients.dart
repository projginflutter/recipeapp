import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/model/ingredient.dart';


class IngredientsList extends StatefulWidget {

  IngredientsList(this.renderList);

  final List<Ingredient> renderList;

  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {

  Widget _buildItem(Ingredient ingredient) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.description),
            title: Text(ingredient.name),
            trailing: Text('${ingredient.amount}  ${ingredient.unit}'),
            subtitle: Text('Description'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:[
        ListView.builder(
          itemBuilder: (context, index) {
            return _buildItem(this.widget.renderList[index]);
          },
          itemCount: this.widget.renderList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        ),
      ]
    );

  }
}

