import 'package:flutter/material.dart';

import './cart.dart';

class OrderItem {
  final String Id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;

  OrderItem(
      {required this.Id,
      required this.datetime,
      required this.amount,
      required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            Id: DateTime.now().toString(),
            datetime: DateTime.now(),
            amount: total,
            products: cartProducts));
    notifyListeners();
  }
}
