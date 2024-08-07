import 'package:doan_tmdt/screen/detail_cart.dart';
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

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartItem = [
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food1',
        size: 1,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food2',
        size: 2,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food3',
        size: 3,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food3',
        size: 1,
        price: 20000,
        count: -2),
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food4',
        size: 3,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food5',
        size: 2,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food6',
        size: 1,
        price: 20000,
        count: 2),
    CartItem(
        imageUrl:
            'https://superfoods.vn/wp-content/uploads/2023/07/banh-mi-hamburger-truyen-thong.jpeg',
        title: 'Food7',
        size: 2,
        price: 20000,
        count: 2),
  ];
  @override
  Widget build(BuildContext context) {
    int tongtien = 2000000;
    int thanhtien = 300000000;
    int dagiam = 5000000;
    const List<String> list = <String>[
      'Chọn mã giảm giá',
      'Mã giảm 1',
      'Mã giảm 2',
      'Mã giảm 3',
      'Mã giảm 4'
    ];
    String dropdownValue = list.first;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFD2EDE0),
        body: Column(
          children: [
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Color(0xFFD2EDE0),
                ),
                height: 130,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Chọn mã giảm giá',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          child: DropdownMenu<String>(
                            width: 150,
                            textStyle: TextStyle(
                              fontSize: 11,
                            ),
                            initialSelection: list.first,
                            onSelected: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            dropdownMenuEntries: list
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tổng tiền: '),
                            Text('Đã giảm: '),
                            Text('Thành tiền: ')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$tongtien'),
                            Text('$dagiam'),
                            Text('$thanhtien')
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {
                             // sẽ hiển thị thông báo thành công và xóa các item trong giỏ hàng ...
                            },
                            child: const Text(
                              'Đặt hàng',
                              style: TextStyle(color: Colors.black),
                            ))
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

class cardcart extends StatefulWidget {
  const cardcart({super.key});

  @override
  State<cardcart> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<cardcart> {
  late CartItem cartItems;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: Image.network(
          cartItems.imageUrl,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          cartItems.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size: ${cartItems.size}',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Giá: ${cartItems.price}',
                  style: TextStyle(color: Colors.amber[600]),
                ),
              ],
            ),
            cartItems.count < 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            cartItems.count + 1;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text('${cartItems.count}'),
                          ))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          hoverColor: Colors.green,
                          onPressed: () {
                            setState(() {
                              cartItems.count++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                          )),
                      const SizedBox(width: 10),
                      Text('${cartItems.count}'),
                      const SizedBox(width: 10),
                      IconButton(
                          hoverColor: Colors.green,
                          onPressed: () {
                            setState(() {
                              cartItems.count++;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                          )),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class Cartcard extends StatelessWidget {
  final CartItem cartItems;
  Cartcard({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: Image.network(
          cartItems.imageUrl,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          cartItems.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size: ${cartItems.size}',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Giá: ${cartItems.price}',
                  style: TextStyle(color: Colors.amber[600]),
                ),
              ],
            ),
            cartItems.count < 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            cartItems.count + 1;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text('Xoa'),
                          ))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          hoverColor: Colors.green,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                          )),
                      const SizedBox(width: 10),
                      Text('${cartItems.count}'),
                      const SizedBox(width: 10),
                      IconButton(
                          hoverColor: Colors.green,
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                          )),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
