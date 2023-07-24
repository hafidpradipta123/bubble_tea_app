import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


void removeFromCart(Drink drink){
  Provider.of<BubleTeaShop>(context,listen: false).removeFromCart(drink);

}

  @override
  Widget build(BuildContext context) {
    return Consumer<BubleTeaShop>(
        builder: (context, value, child) => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(children: [
                const Text(
                  "Your Cart",
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
      
                  Drink drink = value.cart[index];

                  return DrinkTile(drink: drink, onTap: () => removeFromCart(drink), trailing: Icon(Icons.delete));
                })),
                MaterialButton(
                  child: Text("PAY", style:TextStyle( color: Colors.white,)),
                  color: Colors.brown,
                  onPressed: (){})
              ]),
            )));
  }
}
