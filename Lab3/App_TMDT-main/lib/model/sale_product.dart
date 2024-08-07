import 'package:doan_tmdt/model/product_model.dart';
import 'package:doan_tmdt/screen/home/product_detail_page.dart';
import 'package:flutter/material.dart';

class SaleProductItem extends StatelessWidget {
  SaleProductItem({super.key,required this.pro});
  Product pro;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      //todo: chức năng nút
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(pro: pro)));
      },
      //* thông tin sale
      child: Container(
        height: 77,
        width: 222,
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        padding: const EdgeInsets.all(13),
        constraints: const BoxConstraints(
          maxHeight: 77,
          maxWidth: 222
        ),
        decoration: ShapeDecoration(
          color: const Color.fromRGBO(46, 91, 69, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 50,
              clipBehavior: Clip.antiAlias,
              constraints: const BoxConstraints(
                maxHeight: 50,
                maxWidth: 50,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: Image.network(pro.img,width: 50,height: 50,fit: BoxFit.fill,),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Giảm ${pro.price - pro.sale_price} VND",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                Text(pro.sale_desc,style: const TextStyle(fontSize: 10,color: Colors.white)),
              ],
            )
          ],
        ),
      )
    );
  }
}