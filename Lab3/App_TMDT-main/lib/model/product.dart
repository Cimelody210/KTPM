import 'package:doan_tmdt/model/product_model.dart';
import 'package:doan_tmdt/screen/home/product_detail_page.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key,img,required this.product});
  String img = 'assets/img/no_image.jpg';
  Product product;
  // String name;
  // String category = "category";
  // int price = 1000000;//? min = 1, max = ?

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //todo: dẫn tới chi tiết sản phẩm
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(pro: product)));
        
      },
      child: Container(
        width: 168,
        height: 268,
        margin: EdgeInsets.fromLTRB(14, 5, 14, 10),
        decoration: ShapeDecoration(
          color: Color.fromRGBO(46, 91, 69, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 125,
              width: 125,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: Image.network(product.img,height: 125,width: 125,),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                Text(product.name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
            ],),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                Text(product.category,style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w100),)
            ],),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Giá:${product.true_price} VND",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)
            ],),
            GestureDetector(
              onTap: (){
                //todo: thêm sản phẩm vào giỏ 
                print("Send ${product.name} to cart");
              },
              child: Container(
                width: 152,
                height: 40,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: ShapeDecoration(
                  color:Color.fromRGBO(210, 237, 224, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ) 
                ),
                child: Row(
                  children: [
                    Icon(Icons.add,color: Color.fromRGBO(46, 91, 69, 1)),
                    Text("Thêm vào giỏ",style: TextStyle(color: Color.fromRGBO(46, 91, 69, 1),fontWeight: FontWeight.bold,fontSize: 14),),
                  ],
                ),
                
              )
            ),
            
          ],
        ),
      ),
    );
  }
}