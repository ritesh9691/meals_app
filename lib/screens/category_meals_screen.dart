import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals_item.dart';
import '../dummy_data.dart';

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
    // storing the id of category which we are showing in the main page of app
    final CatergoryId = argsRoute["id"];
    // we are using the meal Dummy_model to match the id of home screen category ex (Asian, German, Summer).

    // we will map the new value from the dummy model to meal method which we are using with Dummy_Meals.where

    //meal is a new genrated list where we only getting the value which we wanted by applying the return statement meal.categories.contains(CatergoryId);

    //Dummy_meals has category and by using the contians we can match the id's in categories and CategoriesId,
    // if it get matched return new list .
    // so much work....
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(CatergoryId);
    }).toList();
    // this will make sure we only get the value of the category that we have chossen.
    // through the index . the item we will click that index will be procced in the categoryMeals.
    
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(
          // CategoryMeals is used to make sure the the type to meal we are chossing in the home screen ex:(Asian) we only se the that list only(new page with some list of Asian food).
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(title:categoryMeals[index].title , imageUrl: categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability);
          }),
    );
  }
}
