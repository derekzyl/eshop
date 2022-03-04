import '../providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;
  const CartItem({required this.quantity, required this.price, required this.id, required this.title, required this.productId});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
cart.removeItem(productId);
      },
      background: Container(color: Theme.of(context).errorColor,

      child: Icon(
        Icons.delete,
        color:Colors.white,
        size: 40
      ),
      alignment: Alignment.centerRight,
       padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4

        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('\$${price}'),
 ),
            title: Text(title),
            subtitle: Text(' Total : \$${(price * quantity)}'),
            trailing: Text('$quantity'),
          )
        ),
      ),
    );
  }
}
