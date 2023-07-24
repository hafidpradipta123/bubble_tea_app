
import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:bubble_tea_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}


class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {


void goToOrderPage(Drink drink) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrderPage(
            drink: drink,
          )));
    }

    return Consumer<BubleTeaShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const Text("Bubble Tea Shop",
                        style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 15,),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.shop.length,
                            itemBuilder: (context, index) {
                              Drink individualDrink = value.shop[index];

                              return DrinkTile(drink: individualDrink,
                              onTap: ()=> goToOrderPage(individualDrink),
                              trailing: Icon(Icons.arrow_forward),);
                            }
                        )
                    )

                    // heading
                    //list of drink for sale
                  ],
                ),
              ),
            ));
  }
}
