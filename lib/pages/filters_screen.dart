import 'package:flutter/material.dart';
import 'package:flutter_routing/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "filter-screen";
  final Map<String, bool> filters;
  final Function setFilters;
  const FilterScreen(
      {super.key, required this.filters, required this.setFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters["glutenFree"]!;
    _isLactoseFree = widget.filters["lactoseFree"]!;
    _isVegan = widget.filters["vegan"]!;
    _isVegetarian = widget.filters["vegetarian"]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fliters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilter = {
                  "lactoseFree": _isLactoseFree,
                  "vegan": _isVegan,
                  "vegetarian": _isVegetarian,
                  "glutenFree": _isGlutenFree,
                };
                widget.setFilters(selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile("Gluten-Free",
                  "Only include Gluten free meals", _isGlutenFree, (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              const Divider(),
              buildSwitchListTile("Vegan", "Only include Vegan meals", _isVegan,
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              const Divider(),
              buildSwitchListTile(
                  "Vegetarian", "Only include Vegetarian meals", _isVegetarian,
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              const Divider(),
              buildSwitchListTile(
                  "Lactose-Free",
                  "Only include Lactose free meals",
                  _isLactoseFree, (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
              const Divider(),
            ],
          )),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool value, Function switchValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (newValue) => switchValue(newValue),
    );
  }
}
