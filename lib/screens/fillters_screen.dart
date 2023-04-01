import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilltersScreen extends StatelessWidget {
  static const routeName = "/Fillters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Fillters"),
      ),
       drawer: MainDrawer(),
      body: Center(
        child: Text("hello world "),
      ),
     
    );
  }
}
