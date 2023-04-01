import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  // setting the name route name as routeName
  // we can use this directly in the home routes and pushedNamed
  static const routeName = "/meal-detail";
  // to avoid doing same thing again and again we use Widget method to build our own widget
  // it take context as argument as optional parameter that we want to give to it.
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  // we will make the builder method for the containers because it is repeating it self
  // it will take a child as a argument becuse container take child.
  // so here we will pass a dynamic child that we wnt to show.
// giving chils as argument becuase child of every container can be diffrent
  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 350,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    // we are using mealid to store the value the ID that that as been pushed by the route ,
    // we are only getting one value id from the pusheNamed as string (id)
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // problem now we have to get the image of the selected receipe and all it's details
    // we will match the id from the mealId and the id we will get from the meal_model.
    // we are now storing the fillterd data from dummy_meal into selected meal.
    //from where method is used to find only that thing that we want
    // we matching the id that user has clicked and the id from the dummy_meal
    // if they matches all the data will be avalible in the selecteMeal.
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingrdients"),
            // child is taken directly in the above method where we created it
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    )))),
          ],
        ),
      ),
    );
  }
}
