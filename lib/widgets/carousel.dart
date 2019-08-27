import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

import '../recipeDetail.dart';

class Carousel extends StatelessWidget {
  //TODO change this to get model and relevant recipe data
  Carousel(this.count, this.direction, this.foodName, this.imgPath);

  /// Recipe Name
  final int count;
  //Short description
  final Axis direction;

  final String foodName;

  final String imgPath;

  Widget _generateItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RecipeCard(
          'Recipe Name',
          'Description of the recipe item goes here',
          'assets/images/avocado.jpg'),
    );
    //TODO Get Data from provider based on criteria in the state
    /*FutureBuilder<Set>(
          future: prefs.preferredCategories,
          builder: (context, snapshot) {
            final data = snapshot.data ?? Set<>();
            return RecipeCard(, , data.contains(category));
          }),*/
  }

/*
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: ListView.builder(
          itemCount: count,
          scrollDirection: this.direction,
          itemBuilder: (context, index) {
            return _generateItem();
          },
        ));
  }
*/

/*
  @override
  Widget _build() {
    return InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: imgPath, foodName: foodName, foodPrice: price))));
        },
        child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6.0,
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5.0)
                    ]),
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: 175.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.white, Color(0xFFACBEA3)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)))),
                    Hero(
                        tag: imgPath,
                        child: Container(
                          height: 175.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                        )),
                    Positioned(
                        top: 160.0,
                        right: 20.0,
                        child: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              child: Center(
                                  child: Icon(Icons.favorite,
                                      color: Colors.red, size: 17.0)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white),
                            ))),
                    Positioned(
                        top: 190.0,
                        left: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(foodName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 14.0)),
                            SizedBox(height: 3.0),
                            Container(
                                width: 175.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '4.9',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.grey,
                                              fontSize: 12.0),
                                        ),
                                        SizedBox(width: 3.0),
                                        Icon(Icons.star,
                                            color: Colors.green, size: 14.0),
                                        Icon(Icons.star,
                                            color: Colors.green, size: 14.0),
                                        Icon(Icons.star,
                                            color: Colors.green, size: 14.0),
                                        Icon(Icons.star,
                                            color: Colors.green, size: 14.0),
                                        Icon(Icons.star,
                                            color: Colors.green, size: 14.0),
                                      ],
                                    ),
                                    Text(price,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 16.0)),
                                  ],
                                ))
                          ],
                        ))
                  ],
                ))));
  }
*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) =>
                  DetailsPage(heroTag: imgPath, foodName: foodName))));
        },
        child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffffffff)),
            child: ListView.builder(
              itemCount: count,
              scrollDirection: this.direction,
              itemBuilder: (context, index) {
                return _generateItem();
              },
            )));
  }
}
