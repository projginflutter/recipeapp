import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/styles.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/model/instruction.dart';


class StepsList extends StatefulWidget {

  StepsList(this.renderList);

  final List<Instruction> renderList;

  @override
  _StepsListState createState() => _StepsListState();
}

class _StepsListState extends State<StepsList> {

  Widget _buildItem(Instruction instruction) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Step ${instruction.stepNumber}'),
            ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text(instruction.instruction),
            subtitle: Text('Description'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    print(this.widget.renderList);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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

