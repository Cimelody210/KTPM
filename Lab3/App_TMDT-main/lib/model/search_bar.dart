import 'package:doan_tmdt/model/search_product_list.dart';
import 'package:doan_tmdt/screen/home/search_page.dart';
import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //todo: chuyển qua trang tìm kiếm 
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => SearchScreen()));

      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: ShapeDecoration(
          color: const Color.fromRGBO(210, 237, 224, 0.69),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          )
          ),
        child:Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 125,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: const Text("Tìm kiếm sản phẩm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            const Icon(Icons.search,color: Colors.white)
          ],
        )
      ),
    );
  }
}
