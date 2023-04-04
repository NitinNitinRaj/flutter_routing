import 'package:flutter/material.dart';
import 'package:flutter_routing/pages/categories_screen.dart';
import 'package:flutter_routing/pages/favorite_screen.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favorites",
              ),
            ],
          ),
        ),
        // body: TabBarView(children: [CategoriesScreen(), FavoriteMeals()]),
      ),
    );
  }
}
