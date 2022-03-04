import 'package:neweshop/providers/orders.dart';
import 'package:neweshop/screens/orders_screen.dart';

import './screens/products_overview_screen.dart';
import 'package:flutter/material.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import 'providers/cart.dart';
import 'screens/cart_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx)=>Products()),
        ChangeNotifierProvider(
            create: (ctx)=>Cart()),

        ChangeNotifierProvider(
            create: (ctx)=>Orders()),

      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.deepOrange,
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',

        ),
        home: const MyHomePage(),
        routes: {
ProductDetailScreen.routeName : (ctx)=> ProductDetailScreen(),
          CartScreen.routeName :(ctx)=> CartScreen(),
          OrdersScreen.routeName:(ctx)=> OrdersScreen(),
        },
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ProductsOverviewScreen()
    );
  }
}

