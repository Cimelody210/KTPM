import 'package:doan_tmdt/model/product.dart';
import 'package:doan_tmdt/model/product_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Query _dbRef = FirebaseDatabase.instance.ref().child('products');
  List<Product> pro = [];

  @override
  void initState(){
    _dbRef.onValue.listen((event) {
      if(this.mounted){
        setState(() {
          pro = event.snapshot.children.map((snapshot){
            return Product.fromSnapshot(snapshot);
          }).toList();
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 285 * (pro.length/2).ceil().toDouble(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: (pro.length / 2).ceil(),
        itemBuilder: (context,index){
          if(pro.length% 2 != 0 && index == ((pro.length / 2).ceil()) - 1){
            return Row(
              children: [ProductItem(product: pro[index*2])
              ],);
          }
          else{
            return Row(
              children: [
                ProductItem(product: pro[index*2]),
                ProductItem(product: pro[index*2+1])
              ],
            );
          }
        }
      )
    );
  }
}