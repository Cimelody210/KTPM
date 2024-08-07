import 'package:doan_tmdt/model/search_product.dart';
import 'package:doan_tmdt/model/search_product_list.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController(text:"");
  String search="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56), 
        child: AppBar(
          title: const Text("Tìm kiếm sản phẩm",style: TextStyle(color: Color.fromRGBO(210, 237, 224, 0.8),fontWeight: FontWeight.bold),),
          backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(210, 237, 224, 0.8),//mau ca trang
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: const ShapeDecoration(
                color: Color.fromRGBO(46, 91, 69, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)
                  )
                ),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                width: MediaQuery.of(context).size.width/5,
                height: 1,
                child:SearchBar(
                  controller: searchController,
                  hintText: "Tìm kiếm",
                  hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  backgroundColor: MaterialStateProperty.all(Color.fromRGBO(210, 237, 224, 0.8),), //mau thanh search
                  leading: const Icon(Icons.search,color: Colors.white),
                  trailing: <Widget>{
                    IconButton(
                      icon: const Icon(Icons.close,color: Colors.white,),
                      onPressed: (){
                        setState(() {
                          searchController = TextEditingController(text: "");
                          search = "";
                        });
                      },
                    )
                  },
                  onSubmitted: (value) {
                    //todo: tìm kiếm sản phẩm theo tên 

                    setState(() {
                      search = value;
                    });
                  },
                ),
              ),
            ),
             SearchProductList(search: search),
          ],
        ),
      ),
    );
  }
}