import 'package:doan_tmdt/model/product_model.dart';
import 'package:doan_tmdt/model/sale_product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SaleProductList extends StatefulWidget {
  const SaleProductList({super.key});

  @override
  State<SaleProductList> createState() => _SaleProductListState();
}

class _SaleProductListState extends State<SaleProductList> {
final Query _dbRef = FirebaseDatabase.instance.ref().child('products');
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
      height: 84,
      width: MediaQuery.of(context).size.width - 10,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pro.length,
        itemBuilder: (context,index){
          if(pro[index].sale_price > 0){
            return Row(
              children: [
                SaleProductItem(pro: pro[index],),
              ],
            );
          }else{
            return SizedBox(height: 0,width: 0,);
          }
        }
      ),
    );
  }
}