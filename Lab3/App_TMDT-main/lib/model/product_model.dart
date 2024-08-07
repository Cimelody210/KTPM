import 'package:firebase_database/firebase_database.dart';

class Product {
  final String img;
  final String name;
  final String category;
  final String desc;
  int price;  //gia truoc khi giam
  final String sale_desc;
  int sale_price; // gia sau khi giam

  Product({
    required this.img,
    required this.name,
    required this.category,
    required this.desc,
    required this.price,
    required this.sale_desc,
    required this.sale_price,
  });
  int get true_price => (sale_price != 0) ? sale_price : price;

  factory Product.fromSnapshot(DataSnapshot snapshot) {
    return Product(
        img: snapshot.child('img').value.toString(),
        name: snapshot.child('name').value.toString(),
        category: snapshot.child('category').value.toString(),
        desc: snapshot.child('desc').value.toString(),
        price: int.parse(snapshot.child('price').value.toString()),
        sale_desc: snapshot.child('sale_desc').value.toString(),
        sale_price: int.parse(snapshot.child('sale_price').value.toString()),
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'name': name,
      'category': category,
      'desc': desc,
      'price': price,
      'sale_desc': sale_desc,
      'sale_price': sale_price,
    };
  }
}
