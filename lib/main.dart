import 'package:flutter/material.dart';
import 'package:recipeapp/widgets/bottombar.dart';
import 'package:recipeapp/screens/home.dart';
import 'package:recipeapp/screens/favorites.dart';
import 'package:recipeapp/screens/search.dart';
import 'package:recipeapp/screens/view_cart.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/provider_bootstrap.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/viewmodel/recipes.dart';
import 'package:recipeapp/services/recipe_service.dart';

void main() => runApp(MyAppFactory());

class MyAppFactory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) {
          RecipeService _service = new RecipeService('recipes');
          return Recipes(service: _service);
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

  final _pageOptions = [HomePage(), SearchPage(), FavoritePage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int pageIndex) {
            setState(() {
              _selectedPage = pageIndex;
            });
          }, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search, color: Colors.green),
              title: new Text('Search'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.green),
                title: Text('Favorites')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.green),
                title: Text('View Cart'))
          ]),
    );
  }
}
