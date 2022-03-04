import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {

  // final String imageurl;
  // final String id;
  // final String title;
  //
  //
  //
  //
  //
  // ProductItem({required this.imageurl, required this.id, required this.title}) ;

  @override
  Widget build(BuildContext context) {
   final prod= Provider.of<Product>(context,  listen: false);
   final cart = Provider.of<Cart>(context);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProductDetailScreen(title: title,)));
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments:prod.id   );
          },
              child: Image.network(prod.imageUrl, fit: BoxFit.cover,)),
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (ctx, prod, child)=> IconButton(icon: prod.isFavorite? Icon(Icons.favorite): Icon(Icons.favorite_border),
                color: Theme.of(context).accentColor,
                onPressed: () {
                return prod.toggleListen();  },),
            ),
              trailing: IconButton(icon: Icon(Icons.shopping_cart, ),
                color: Theme.of(context).accentColor,
                onPressed: () { 
                cart.addItem(prod.id, prod.price, prod.title);
                },),
              title: Text(prod.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black54,)
        ),
      );
  }
}
