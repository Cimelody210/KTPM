import 'package:flutter/material.dart';

class WaitDelivery extends StatefulWidget {
  const WaitDelivery({super.key});

  @override
  State<WaitDelivery> createState() => _WaitDeliveryState();
}

class _WaitDeliveryState extends State<WaitDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chờ giao hàng',style: TextStyle(color: Colors.white)),
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
        child: Text('Nội dung trang edit'),
      ),
    );
  }
}