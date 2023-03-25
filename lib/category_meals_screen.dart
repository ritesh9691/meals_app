import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  // made this property and constructor to get the data and use navigator.push. but i will use pushedNavigator. which has diffrent mehcanism.

  // final String CategoryId;
  // final String CategoryTitle;
  // CategoryMealsScreen(
  //   this.CategoryId,
  //   this.CategoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    // saving our data in the argsRoute variable
    // we made our route in map so we load it from map
    final argsRoute =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // storing in the new variable loaded from the map of the argsRoute.
    final CategoryTitle = argsRoute["title"];
    final CatergoryId = argsRoute["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: Center(
        child: Text("the current recipe is!"),
      ),
    );
  }
}
