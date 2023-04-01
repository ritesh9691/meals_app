import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildListTile(String title, IconData icons, Function handler) {
    return ListTile(
      leading: Icon(
        icons,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "RobotCondensed",
            fontSize: 24),
      ),
      onTap: 
        handler,
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BuildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          BuildListTile("Filters", Icons.settings, () {            Navigator.of(context).pushReplacementNamed("/Fillters");}),
        ],
      ),
    );
  }
}
