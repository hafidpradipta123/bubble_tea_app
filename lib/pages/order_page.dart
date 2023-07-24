import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required this.drink});
  final Drink drink;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double pearlValue  =0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }
    void customizeIce(double newValue) {
      setState(() {
        iceValue = newValue;
      });
    }
      void customizePearl(double newValue) {
        setState(() {
          pearlValue = newValue;

        });

  }

  void addToCart(){
    Provider.of<BubleTeaShop>(context, listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(context: context, builder: (context) => AlertDialog(title: Text("Successfully added to a cart"),));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body: Column(children: [
        Image.asset(widget.drink.imagePath),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 100, child: Text('Sweet')),
                  Expanded(
                    child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 100, child: Text('Ice')),
                  Expanded(
                    child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 100, child: Text('Pearl')),
                  Expanded(
                    child: Slider(
                        value: pearlValue,
                        label: pearlValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearl(value)),
                  )
                ],
              ),
            ],
          ),
        ),

        MaterialButton(
          child: Text('Add to cart',
          style: TextStyle(color: Colors.white),),
          color: Colors.brown,
          onPressed: addToCart)
      ]),
    );
  }
}
