import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DeliMeals"),
      ),
      body: GridView(
        padding: EdgeInsets.all(20),

        // we passing the value of Dummy model into single children
        // we use .map to map the value of the Dummy list to into new list 
        // the new list name here is catData. we create a new list with that name and pass the value 
        //  we are passing the value from dummy list to catmeal list (catmeal is using .tolist()to make itself into in a list )
        // we want to pass the only data that CategoryItems required.
        // the dummy_category has all the field that we have created in it . but we want only specific detailes from that list so thats why new list (CatData).
        // now the data contained in new list (catData) is maped into new widget named CategoryItems.
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItems(
                catData.color,
                catData.title,
                catData.id,
              ),
            )
            .toList(),
            // constructor used to give shape to gridview
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
