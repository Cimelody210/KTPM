import 'package:doan_tmdt/model/product_model.dart';
import 'package:doan_tmdt/model/sale_product.dart';
import 'package:doan_tmdt/model/search_product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class SearchProductList extends StatefulWidget {
  SearchProductList({super.key,required this.search});
  String search;
  @override
  State<SearchProductList> createState() => _SearchProductListState();
}

class _SearchProductListState extends State<SearchProductList> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width-360)/2, 5, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 151,
          child: ListView.builder(
            itemCount: pro.length,
            itemBuilder: (context,index){
              if(widget.search!=""){
                if(pro[index].name.toLowerCase().contains(widget.search.toLowerCase())){
                  return Row(children: [SearchProduct(product: pro[index],)]);
                }
                else{
                  return SizedBox(height: 0,width: 0,);
                }
              }
              else{
                return Row(children: [SearchProduct(product: pro[index],)]);
              }
            },
          ),
        )
      ],);    
  }
}