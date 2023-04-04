import 'package:flutter/material.dart';
import 'package:flutter_routing/modules/meals.dart';
import 'package:flutter_routing/pages/categories_screen.dart';
import 'package:flutter_routing/pages/favorite_screen.dart';
import 'package:flutter_routing/widgets/main_drawer.dart';

class TabPageTwo extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabPageTwo({super.key, required this.favoriteMeals});

  @override
  State<TabPageTwo> createState() => _TabPageTwoState();
}

class _TabPageTwoState extends State<TabPageTwo> {
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {
        "page": FavoriteMeals(favoriteMeals: widget.favoriteMeals),
        "title": "Favorites"
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_pages[_selectedPageIndex]["title"]}"),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
