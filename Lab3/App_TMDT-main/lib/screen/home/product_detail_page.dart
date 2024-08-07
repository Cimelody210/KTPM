import 'package:auto_size_text/auto_size_text.dart';

import 'package:doan_tmdt/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key,required this.pro});
  Product pro;


  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isButtonPressed = false;
  bool isButtonPressed40 = false;
  bool isButtonPressed41 = false;
  bool isButtonPressed42 = false;
  bool isButtonPressed43 = false;
  bool iconTraiTim = false;
  bool btnDo = true;
  bool btnXanh = false;
  bool btnVang = false;
  bool btnLuc = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro.name,style:const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white)
      ),
      body: Container(
        width: width,
        //color:Color(0xFFD2EDE0),
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              width: 400,
              height: 300,
              decoration: const ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                        Container(
                          child: Image.network(widget.pro.img,height: 150,width: MediaQuery.of(context).size.width,),
                        ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text('${widget.pro.true_price} VND',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,decoration: TextDecoration.none)),
                        Spacer(),
                        IconButton(
                            onPressed: (){
                              setState(() {
                                iconTraiTim = !iconTraiTim;
                              });
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(iconTraiTim ? Colors.transparent:Colors.transparent),),
                            icon: Icon(iconTraiTim ? Icons.favorite : Icons.favorite_border ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Mô tả",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none),),
                        ),
                        Container(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: AutoSizeText(widget.pro.desc,softWrap: true,style:const TextStyle(color: Colors.black,fontSize: 17,decoration: TextDecoration.none,fontWeight: FontWeight.normal),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text("Size",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none),),
                              ],
                            )
                          ),
                          Container(
                            width: 370,
                            child: Padding(
                              padding: EdgeInsets.all(0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(0.1),
                                        child: ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            isButtonPressed = !isButtonPressed;
                                            isButtonPressed40 = false;
                                            isButtonPressed41 = false;
                                            isButtonPressed42 = false;
                                            isButtonPressed43 = false;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(isButtonPressed ? Color.fromARGB(255, 20, 111, 29):Colors.transparent),
                                        ),
                                        child: Text(isButtonPressed ? '39' : '39',style: TextStyle(color: Colors.black))
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(0.1),
                                        child: ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            isButtonPressed = false;
                                            isButtonPressed40 = !isButtonPressed40;
                                            isButtonPressed41 = false;
                                            isButtonPressed42 = false;
                                            isButtonPressed43 = false;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(isButtonPressed40 ? Color.fromARGB(255, 20, 111, 29):Colors.transparent),
                                        ),
                                        child: Text(isButtonPressed40 ? '40' : '40',style: TextStyle(color: Colors.black))
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(0.1),
                                        child: ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            isButtonPressed = false;
                                            isButtonPressed40 = false;
                                            isButtonPressed41 = !isButtonPressed41;
                                            isButtonPressed42 = false;
                                            isButtonPressed43 = false;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(isButtonPressed41 ? Color.fromARGB(255, 20, 111, 29):Colors.transparent),
                                        ),
                                        child: Text(isButtonPressed41 ? '41' : '41',style: TextStyle(color: Colors.black))
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 257,
                            child: Padding(
                              padding: EdgeInsets.all(0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(0.1),
                                        child: ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            isButtonPressed = false;
                                            isButtonPressed40 = false;
                                            isButtonPressed41 = false;
                                            isButtonPressed42 = !isButtonPressed42;
                                            isButtonPressed43 = false;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(isButtonPressed42 ? Color.fromARGB(255, 20, 111, 29):Colors.transparent),
                                        ),
                                        child: Text(isButtonPressed42 ? '42' : '42',style: TextStyle(color: Colors.black))
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(0.1),
                                        child: ElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            isButtonPressed43 = !isButtonPressed43;
                                            isButtonPressed = false;
                                            isButtonPressed40 = false;
                                            isButtonPressed41 = false;
                                            isButtonPressed42 = false;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(isButtonPressed43 ? Color.fromARGB(255, 20, 111, 29):Colors.transparent),
                                        ),
                                        child: Text(isButtonPressed43 ? '43' : '43',style: TextStyle(color: Colors.black))
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(height: 10),
                        const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Các loại màu",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none),),
                        ),
                        Container(
                            width: 370,
                            child: Padding(
                              padding: EdgeInsets.all(0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 50,
                                        padding: EdgeInsets.all(0.1),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(15.0),
                                          border: Border.all(
                                            width: 3.0,
                                            color: btnDo ? Colors.black:Colors.transparent,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              btnDo = !btnDo;
                                              btnLuc = false;
                                              btnVang = false;
                                              btnXanh = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ]
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.all(0.1),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(15.0),
                                          border: Border.all(
                                            width: 3.0,
                                            color: btnXanh ? Colors.black:Colors.transparent,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              btnDo = false;
                                              btnLuc = false;
                                              btnVang = false;
                                              btnXanh = !btnXanh;
                                            });
                                          },
                                        ),
                                      ),
                                    ]
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.all(0.1),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(15.0),
                                          border: Border.all(
                                            width: 3.0,
                                            color: btnVang ? Colors.black:Colors.transparent,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              btnDo = false;
                                              btnLuc = false;
                                              btnVang = !btnVang;
                                              btnXanh = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ]
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.all(0.1),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(15.0),
                                          border: Border.all(
                                            width: 3.0,
                                            color: btnLuc ? Colors.black:Colors.transparent,
                                          ),
                                        ),
                                        
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              btnDo = false;
                                              btnLuc = !btnLuc;
                                              btnVang = false;
                                              btnXanh = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ]
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Chính sách",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.none),),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 330,
                                    child: const AutoSizeText('Chúng tôi cam kết hàng đúng như mô tả có thể trả hàng trong vòng 7 ngày.',softWrap: true,style: TextStyle(color: Colors.black,fontSize: 17,decoration: TextDecoration.none,fontWeight: FontWeight.normal),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: 370,
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(400, 50),
                                  backgroundColor: Color.fromARGB(255, 20, 111, 29),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Thêm vào giỏ hàng',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            )
                            ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}