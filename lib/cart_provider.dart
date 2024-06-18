import "package:flutter/material.dart";
class CartProvider extends ChangeNotifier{
  final  List<Map<String,dynamic>> cart=[];
  void addProduct(Map<String,dynamic> p){
    cart.add(p);
    notifyListeners();
  }
  void removeProduct(Map<String,dynamic> p){
    cart.remove(p);
    notifyListeners();
  }
}