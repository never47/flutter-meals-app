import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) {
          return MealDetail(
            meal: meal,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Uh oh... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: () {
            _selectMeal(
              context,
              meals[index],
            );
          },
        ),
      );
    }

    if (title == null) {
      return body;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: body,
    );
  }
}
