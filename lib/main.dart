import 'package:flutter/material.dart';
import 'screens/category_meals_screen.dart';
import 'screens/catergories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.indigoAccent),
        canvasColor: Color.fromRGBO(225, 235, 185, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        // routes take context to know that where is the widget is placed in widget tree 
        "/": (context) => CategoriesScreen(),
        // we are storing the name of the route in (static const routename) ...it can be named anything
        // now the widget.getting the name of the route from the rouutename.
        // then transfering to the the new widget whom value context has stored.
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
      },
    );
  }
}
