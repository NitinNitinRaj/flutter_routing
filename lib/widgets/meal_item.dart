import 'package:flutter/material.dart';
import 'package:flutter_routing/modules/meals.dart';
import 'package:flutter_routing/pages/meal_info_screen.dart';
import 'package:flutter_routing/widgets/meal_info_bar_item.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealInfo.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        // removeMeal(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      alignment: Alignment.center,
                      width: 220,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MealInfoBarItem(info: "$duration min", icons: Icons.schedule),
                  MealInfoBarItem(
                      info: complexity.name.toString(), icons: Icons.work),
                  MealInfoBarItem(
                      info: affordability.name.toLowerCase(),
                      icons: Icons.attach_money),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
