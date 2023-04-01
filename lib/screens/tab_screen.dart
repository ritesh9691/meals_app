import 'package:flutter/material.dart';
import 'package:meals_app/screens/catergories_screen.dart';

import '../widgets/main_drawer.dart';
import 'FavoriteScreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // we make the list of the widget that we want to bind with the icons in the bottombar
  final List<Map<String, Object>> _pages = [
    {"pages": CategoriesScreen(), "title": "Categories"},
    {"pages": FavoriteScreen(), "title": "Your Favorite"},
  ];
  // set the intial index to the zero so the first Widget will be shown
  int _selectedPageIndex = 0;
// we make the method to set the page index
// after the user will tap the second icon the ontap will return index 2.
// index to will be passed in the _selectPage and the _selectedPageIndex value will be changed to 1
// so setstate will render the new widget tree
  void _selectPage(int index) {
    //  to use the bottom navigation we have to use always use the statefull widget
    // becuase it setstate the value to new widget screen.
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  // we want to show the tab bar on the bottom of the scree.
  // but DefualtTanController shows the widget on the top
  // so we will coment all this code ....it was just for future refrence.
  Widget build(BuildContext context) {
    // to make a tab screen on app bar we use DefualtTabController
    // it show the first tab by defualt we placed in first
    // use Tabbar to load tabs in bottom of the appbar.
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Meals"),
    //       // take list of tab in to display it on the screen
    //       // first thing on the list will be shown first or will be a defualt tab for the app
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Category",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: "Favorite",
    //           ),
    //         ],
    //       ),
    //     ),
    //     // TabBarView is widget to tell the flutter which screen will be shown on taping the icon on the tab bar
    //     // first screen on the tab will be shown first the second one
    //     body: TabBarView(children: [
    //       CategoriesScreen(),
    //       FavoriteScreen(),
    //     ]),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["pages"],
      // first we are making the bottomVavigation
      bottomNavigationBar: BottomNavigationBar(
        // ontap refers to a void funtion
        // it will return a index value that user has tap
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Catergory"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorite"),
        ],
      ),
    );
  }
}
