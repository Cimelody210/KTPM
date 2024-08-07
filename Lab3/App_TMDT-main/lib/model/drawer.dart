import 'package:doan_tmdt/screen/cart/cart_page.dart';
import 'package:doan_tmdt/screen/home/home_page.dart';
import 'package:doan_tmdt/screen/login/login_page.dart';
import 'package:doan_tmdt/screen/notification/notification_page.dart';
import 'package:doan_tmdt/screen/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key,name});
  //final String name = 'Huan nopro';
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}



class _MyDrawerState extends State<MyDrawer> {

  
  //--------------------------------------------------------
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentIndex = 0;

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
  
  String name = '';
   String url = '';
   
 final List _screens = [HomeScreen(), CartScreen(), NotificationScreen(), ProfileScreen()];


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
      name = infoTitle[0][ID]['fullname'];
      url = infoTitle[0][ID]['url'];
    }catch(e){
      print(e.toString());
    }
    //--------------------------------------------------

    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(46, 91, 69, 1),
              // image: DecorationImage(
              //   image: AssetImage('assets/img/small_logo.png'),
              //   fit: BoxFit.fill,
              // ),
              // gradient: LinearGradient(
              //   colors: [
              //   Color.fromRGBO(46, 91, 69, 1),
              //   Color.fromRGBO(210, 237, 224, 1),
              //   Colors.white
              //   ],
              //   stops:[0.5,0.7,0.9],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter
              // )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.amber,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                 child: ClipOval(
              child: url != null && url.isNotEmpty
                  ? Image.network(
                      url,
                      width: 100,
                      height: 100,

                      fit: BoxFit.cover,
                    )
                  : Container(
                      // Thay thế bằng một widget hoặc hiệu ứng khác khi không có URL hợp lệ
                      color: Colors.grey, // Ví dụ: Màu xám
                    ),
            ),
                ),
                const SizedBox(height: 5),
                Container(
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 248, 245, 247)),
                  ),
                ),
              ],
            ),
          ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.home),
                  Padding(padding: EdgeInsets.only(left:8)),
                  Text('Home')]),
              onTap: () {
                 setState(() {
                _currentIndex = 0;
              });
              Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.shopping_cart),
                  Padding(padding:EdgeInsets.only(left:8)),
                  Text('Cart')]),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.notifications),
                  Padding(padding:EdgeInsets.only(left:8)),
                  Text('Notification')]),
              onTap: () {//
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children:[
                  Icon(Icons.account_circle_outlined),
                  Padding(padding:EdgeInsets.only(left:8)),
                  Text('Profile')]),
              onTap: () {
                  setState(() {
                  _currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
          ),
          ],
        ),
      );
  }
}