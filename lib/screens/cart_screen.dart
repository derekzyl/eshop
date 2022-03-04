import '../providers/cart.dart' show Cart;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = './cart';

  @override
  Widget build(BuildContext context) {
    final cartPrice = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('cart')),
      body: Column(
        children: [
          Card(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 0),
                        Chip(
                          label: Text(
                            '\$${cartPrice.totalAmount}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1
                                    ?.color),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        Spacer(),
                        SizedBox(width: 0),
                        Chip(
                          label: Text(
                            '${cartPrice.quantity}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1
                                    ?.color),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        FlatButton(
                            onPressed: () {
                              Provider.of<Orders>(context, listen: false).addOrder(
                                  cartPrice.items.values.toList(),
                                  cartPrice.totalAmount);
                              cartPrice.clear();
                            },
                            child: Text(
                              'order now',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ))
                      ]))),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                  productId: cartPrice.items.keys.toList()[i],
                  quantity: cartPrice.items.values.toList()[i].quantity,
                  id: cartPrice.items.values.toList()[i].id,
                  price: cartPrice.items.values.toList()[i].price,
                  title: cartPrice.items.values.toList()[i].title),
              itemCount: cartPrice.itemCount,
            ),
          )
        ],
      ),
    );
  }
}
