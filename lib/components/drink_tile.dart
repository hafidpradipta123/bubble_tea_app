import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  const DrinkTile({super.key, required this.drink, required this.onTap, required this.trailing});
  final Drink drink;
  final void Function()? onTap;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(color: Colors.brown[100],
        borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath),
          trailing: trailing
        ),
      ),
    );
  }
}