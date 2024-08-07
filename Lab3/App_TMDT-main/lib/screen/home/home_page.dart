import 'package:doan_tmdt/model/drawer.dart';
import 'package:doan_tmdt/model/product.dart';
import 'package:doan_tmdt/model/product_list.dart';
import 'package:doan_tmdt/model/sale_product.dart';
import 'package:doan_tmdt/model/sale_product_list.dart';
import 'package:doan_tmdt/model/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //--------------------------------------------------------
  final FirebaseAuth _auth = FirebaseAuth.instance;

 String getUserUIDString() {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Kiểm tra xem user có khác null không trước khi truy cập thuộc tính uid
    String userUID = user.uid;
    return userUID;
  }
  // Trả về một giá trị mặc định hoặc chuỗi trống tùy thuộc vào yêu cầu của bạn
  return ''; // hoặc return 'Giá trị mặc định';
}
//------------------------------------------------------------
  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL:
        'https://tmdt-bangiay-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref();
  
   List<Map<dynamic, dynamic>> lst_users = [];
   List<Map<dynamic, dynamic>> infoTitle = [];


  Future<void> _loadData() async {
    try {
      DatabaseEvent _event = await _databaseReference.once();
      DataSnapshot? _dataSnapshot = _event.snapshot;
      if (_dataSnapshot != null && _dataSnapshot.value != null) {
        Map<dynamic, dynamic> data = (_dataSnapshot.value as Map)['infomation'];
        data.forEach((key, value) {
          lst_users.add(value);
        });
      }
      String UID = getUserUIDString();
      for( var element in lst_users)
      {
       print("Đây là key: " + element.keys.toString());
       String UIDS = "($UID)";
       print("Đây là UID: "+ UIDS);
       
        if(element.keys.toString() == UIDS){
          infoTitle.add(element);
        }
      }
      
      setState(() {
        
      });
    } catch (e) {
      print(e.toString());
      
    }
    print(lst_users);
     print(infoTitle);
  }
  
  String diachi = '';
   

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
//-----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    //--------------------------------------------------------
    String ID = getUserUIDString();
    try{
      diachi = infoTitle[0][ID]['address'];
    }catch(e){
      print(e.toString());
    }
    //--------------------------------------------------
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        color: const Color.fromRGBO(210, 237, 224, 1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(46, 91, 69, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children:[
                    Search_Bar(),
                    //? chuyển thành model Location
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Giao hàng đến",style: TextStyle(color: Color.fromRGBO(210, 237, 224, 0.8)),),
                              //? Icon -> IconButton
                              Icon(Icons.location_on_outlined,color: Color.fromRGBO(210, 237, 224, 0.8),)
                            ],
                          ),  
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(diachi,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                            ],
                          ), 
                        ],
                      ),
                    )
                  ]           
                ),
              ),
              //* Sản phẩm giảm giá
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                margin: const EdgeInsets.fromLTRB(10 , 10, 0, 5),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Text("Giảm giá",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: [
                        SaleProductList()
                      ],
                    ),
                  ],
                ),
              ),
              //* danh sach san pham
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Text("Sản phẩm",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                  ],),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ProductList()
                  ],)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}