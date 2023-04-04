import 'package:flutter/material.dart';
import 'package:flutter_routing/modules/meals.dart';
import 'package:flutter_routing/pages/categories_meals_screen.dart';
import 'package:flutter_routing/pages/categories_screen.dart';
import 'package:flutter_routing/pages/filters_screen.dart';
import 'package:flutter_routing/pages/meal_info_screen.dart';
import 'package:flutter_routing/pages/tab_bar_screen_two.dart';
import 'package:flutter_routing/utils/dummy_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map<String, bool> _filters = {
    "lactoseFree": false,
    "vegan": false,
    "vegetarian": false,
    "glutenFree": false,
  };

  List<Meal> _availableMeals = dummyMeals;

  void _setFilter(Map<String, bool> selectedFilter) {
    setState(() {
      _filters = selectedFilter;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters["lactoseFree"]! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"]! && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"]! && !meal.isVegetarian) {
          return false;
        }
        if (_filters["glutenFree"]! && !meal.isGlutenFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  final _theme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: "Raleway",
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed",
          ),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme.copyWith(
        colorScheme: _theme.colorScheme.copyWith(
          secondary: Colors.amber,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => const TabPageTwo(),
        CategoriesMealsScreen.routeName: (_) =>
            CategoriesMealsScreen(availableMeals: _availableMeals),
        MealInfo.routeName: (_) => const MealInfo(),
        FilterScreen.routeName: (_) =>
            FilterScreen(filters: _filters, setFilters: _setFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // onGenerateRoute: (settings) { print(settings.arguments);}, if no route is registered for pushNamedRoute
    );
  }
}
