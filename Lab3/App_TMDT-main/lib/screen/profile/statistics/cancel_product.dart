import 'package:flutter/material.dart';

class CancelProduct extends StatefulWidget {
  const CancelProduct({super.key});

  @override
  State<CancelProduct> createState() => _CancelProductState();
}

class _CancelProductState extends State<CancelProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đã hủy',style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Xử lý khi nút arrow_back được nhấn
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      body: Center(
        child: Center(
        child: Container(
           width: MediaQuery.of(context).size.width, 
        height: MediaQuery.of(context).size.height,
          color: Color(0xFFD2EDE0),
          child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromRGBO(59, 122, 91, 1),
                borderRadius: BorderRadius.circular(10.0), // Điều chỉnh giá trị này để thay đổi độ cong của bo góc
              ),
              child: Center(
                child: Row(
                  children: [
                    Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: Image.asset('assets/img/no_image.jpg',height: 125,width: 125,),
               ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: null, child: Text('Mua lại',style: TextStyle(color: Color.fromRGBO(59, 122, 91, 1),),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(203, 222, 213, 1)),),),
                  Text('Dép tổ ong',style: TextStyle(fontSize: 24,color: Colors.white),),
                 
                  Row(children: [SizedBox(width: 25,), Text('vũ khí của má',style: TextStyle(color: Colors.white),),SizedBox(width: 40,),Text('x1',style: TextStyle(color: Colors.white),)],),
                  Text('giá: 1000000',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('Thành tiền: 1000000',style: TextStyle(fontSize: 15,color: Colors.white),),
                ],
               )
                  ],
                ),
              ),
              
            )

              
          ],
        ),
        ),
      ),
      ),
    );
  }
}