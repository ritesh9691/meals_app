import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItems extends StatelessWidget {
  // we required this fields to pass it in the widgets 
  final String id;
  final String title;
  final Color color;
  CategoryItems( this.color, this.title, this.id);

  // navigator take context we gave it our made context 
  void _selectCategory(BuildContext ctx) {
    // this is the method to load the navigator with push function
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id,title);
    //     },
    //   ),
    // );
    // used in same selectcatergory function.
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
    // we gave argument to pass details for the widget to pass 
    // so it can use in next widget 
        arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //  some methods needs to base buildcontext context for the method to work
      // beacuse above _selectcategory uses ctx as context   
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
