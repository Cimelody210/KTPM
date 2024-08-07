import 'package:flutter/material.dart';

class CartItem {
  late String imageUrl;
  late String title;
  late double size;
  late double price;
  late int count;
  CartItem(
      {required this.imageUrl,
      required this.title,
      required this.size,
      required this.price,
      required this.count});
}

class detail_cart extends StatefulWidget {
  const detail_cart({super.key});

  @override
  State<detail_cart> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<detail_cart> {
  final List<CartItem> cartItem = [
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://cdn.tgdd.vn/Files/2022/05/28/1435541/cach-chon-size-giay-nike-air-force-1-chuan-vua-ban-chan-202205300637505742.jpg',
        title: 'AF1',
        size: 20,
        price: 20000,
        count: 2),
  ];
  @override
  Widget build(BuildContext context) {
    int tongtien = 2000000;
    int thanhtien = 300000000;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFD2EDE0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ nhận hàng',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Le Quoc Thang | 033****24',
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '24 cô giang, phường cô giang, quận 2,HCM',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItem.length,
                itemBuilder: (context, index) {
                  return Cartcard(cartItems: cartItem[index]);
                },
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.green[200],
                ),
                height: 80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tổng tiền: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$tongtien',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const detail_cart()));
                                },
                                child: const Text(
                                  'Đặt hàng',
                                  style: TextStyle(color: Colors.black),
                                )),
                            SizedBox(
                              height: 10,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    fixedSize: const Size(105, 15)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const detail_cart()));
                                },
                                child: const Text(
                                  'Hủy',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class Cartcard extends StatelessWidget {
  final CartItem cartItems;
  Cartcard({required this.cartItems});
  void tang() {
    cartItems.count++;
  }

  void giam() {
    cartItems.count++;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      margin: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Image.network(
          cartItems.imageUrl,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          cartItems.title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size: ${cartItems.size}',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Giá: ${cartItems.price}',
                  style: TextStyle(color: Colors.amber[600]),
                ),
              ],
            ),
            Text(
              'x${cartItems.count}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
