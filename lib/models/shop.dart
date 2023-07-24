
import 'package:flutter/material.dart';
import 'drink.dart';

class BubleTeaShop  extends ChangeNotifier{
  // list of drink for sale
  final List<Drink> _shop=[
    Drink(
      name: "Pearl Milk Tea",
      price: "4.00",
      imagePath: "assets/images/milktea.png"
    )
  ];

  // list of drinks in user cart

  final List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get user cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addToCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeFromCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }

}