import 'package:flutter/material.dart';
import 'package:neweshop/screens/orders_screen.dart';

 class AppDrawer extends StatelessWidget {
   const AppDrawer({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Drawer(
       child: Column(
         children: [
           AppBar(
             title: Text('Choose'),
             automaticallyImplyLeading: false,
           ),
           Divider(),
           ListTile(
             leading: Icon(Icons.shop),
             title: Text('shop'),
             onTap: () {
               Navigator.of(context).pushReplacementNamed( '/');
             },
           ),
           Divider(),
           ListTile(
             leading: Icon(Icons.payment),
             title: Text('orders'),
             onTap: () {
               Navigator.of(context).pushReplacementNamed( OrdersScreen.routeName );
             },
           ),
         ],
       )
     );
   }
 }
