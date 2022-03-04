import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
   final bool showFav ;
    ProductGrid({required this.showFav});



  @override
  Widget build(BuildContext context) {
   final productData = Provider.of<Products>(context);
   final loadedProducts = showFav? productData.favoriteItem: productData.items;
    return GridView.builder(
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0
      ) ,
      itemBuilder: (ctx, i)=> ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductItem(
          // title: loadedProducts[i].title,
          // id: loadedProducts[i].id,
          // imageurl: loadedProducts[i].imageUrl,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,);
  }
}
