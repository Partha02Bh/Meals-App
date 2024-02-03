import 'package:flutter/material.dart';
import 'package:mealsapp3/models/meal.dart';
import 'package:mealsapp3/screens/meal_detail.dart';
import 'package:mealsapp3/widget/meal_item.dart';


class MealScreen extends StatelessWidget {
  const MealScreen({super.key,required this.meals,this.title});

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          meal: meal,
        ) 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget Content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh ... nothing here!!..',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            const SizedBox(height: 16),
            Text('Try Picking a different Category!!..',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
          ],
        ),
      );

    if(meals.isNotEmpty) {
      Content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index],onSelectMeal: (meal) {
          selectMeal(context, meal);
        })
      );
    }

    if(title == null) {
      return Content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Content,
    );
  }
}