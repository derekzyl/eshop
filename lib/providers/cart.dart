import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
  });


}

class Cart with ChangeNotifier {
 Map<String, CartItem> _items ={};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get quantity {
    var quantity = 0;
    _items.forEach((key, value) {
      quantity += value.quantity;});
    return quantity;
  }
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem){
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
int get itemCount{
    return _items.length;
}

  void addItem(String prodId, double price, String title) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingCart) => CartItem(
              title: existingCart.title,
              id: existingCart.id,
              price: existingCart.price * existingCart.quantity,
              quantity: existingCart.quantity + 1));
    } else {
      _items.putIfAbsent(
          prodId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
 void  clear(){
   _items ={};
   notifyListeners();
 }
}

