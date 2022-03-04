import '../providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // const ProductDetailScreen({required this.title});
static const routeName = '/detail';
  @override
  Widget build(BuildContext context) {
    final productId =ModalRoute.of(context)?.settings.arguments as String;

    final prod =Provider.of<Products>(context , listen: false);
   final loadedProd = prod.findById(productId);
    
    return Scaffold(
      appBar: AppBar(title: Text(loadedProd.title),),
      body: Column(
        children:[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(loadedProd.imageUrl,
              fit: BoxFit.cover,),
          ),
          SizedBox(height:10),
          Text('\$${loadedProd.price}', style: TextStyle(
            color: Colors.grey,
            fontSize: 20
          ),
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: Text(loadedProd.description,
            textAlign: TextAlign.center,
            softWrap: true,),
          )
        ]

      ),
    );
  }
}
