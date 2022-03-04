
import 'package:neweshop/widgets/app_drawer.dart';

import '../providers/cart.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

enum FilterOption { favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  // const ProductsOverviewScreen({Key? key}) : super(key: key);
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  var _showfav = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('eshop'),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOption selectedValue) {
                setState((){
                  if(selectedValue == FilterOption.favorites){
                    _showfav= true;
                  }
                  else{
                    _showfav = false;

                  }
                });

              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('only favorirtes'),
                  value:FilterOption.favorites ,
                ),
                PopupMenuItem(
                  child: Text('show all'),
                  value: FilterOption.All,
                )
              ],
            ),
           // Consumer <Cart>(
           //   builder: (_, cart, ch)=>Badge(child: IconButton(icon: Icon(Icons.shopping_cart),),
           //     value:cart.itemCount.toString() ,
           //     color: Colors.red, key: 1 , ),
           // )
 Consumer<Cart>(
   builder: (_, cart, child)=> Badge(
     child:IconButton(icon: Icon(Icons.shopping_cart), onPressed: () { 
       Navigator.of(context).pushNamed(CartScreen.routeName);
     },),
     value: cart.itemCount.toString(),
     color: Colors.pink

   ),

 )
          ],
        ),
        drawer: AppDrawer(),
        body: ProductGrid(showFav: _showfav));
  }
}
