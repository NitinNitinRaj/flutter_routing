import 'package:flutter/material.dart';
import 'package:flutter_routing/modules/meals.dart';
import 'package:flutter_routing/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = "/categories-meals";
  final List<Meal> availableMeals;
  const CategoriesMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  late final String _categoryTitle;
  late final List<Meal> _categoryMeals;
  var _isDependecyChanges = false;

  void _removeMeal(String id) {
    setState(() {
      _categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    //this is called after initState when widget is fullyFormed
    super.didChangeDependencies();
    if (!_isDependecyChanges) {
      final Map<String, String> navigationArguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      _categoryTitle = navigationArguments["title"]!;
      final String categoryId = navigationArguments["id"]!;
      _categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }

    _isDependecyChanges = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemCount: _categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imageUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
            removeMeal: _removeMeal,
          );
        },
      ),
    );
  }
}
