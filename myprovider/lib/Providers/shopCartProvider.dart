
import 'package:flutter/material.dart';

class ShopCart extends ChangeNotifier{
  List<String> _shoppingCart=['pen','book','basket'];

  int get count=> _shoppingCart.length;

  List<String> get cart=> _shoppingCart;

  void additem(String item)
  {
    _shoppingCart.add(item);
    notifyListeners();
  }




}