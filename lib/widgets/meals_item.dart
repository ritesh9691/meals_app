import "package:meals_app/screens/meal_detail_screen.dart";

import "../widgets/meals_item.dart";
import 'package:flutter/material.dart';
import "../models/meals.dart";

class MealItem extends StatelessWidget {
  // we wnat these values
  // we need id to value of the meal to show the full image and recepie in the next page
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.id,
      @required this.complexity,
      @required this.affordability});

  // we get the value of the enums with get method
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;

      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
// defualt method if no other case works
        defualt:
        return "Unknown";
    }
  }

  String get affordablityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;

      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";

        break;

        defualt:
        return "Unknown";
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,
    // arguments can take value in map, string ,list of key value ect 
    // we just have to specify to the next widget that we are expecting this details with pushNamed
    //  of this kind of data(String, map, list etc..)
        arguments: id,);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 30,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black54,
                  ),
                  width: 300,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 5,
                    ),
                    Text("${duration} min"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.price_check),
                    SizedBox(
                      width: 5,
                    ),
                    Text(affordablityText),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
