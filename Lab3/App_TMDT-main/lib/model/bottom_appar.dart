import 'package:doan_tmdt/model/drawer.dart';
import 'package:doan_tmdt/screen/cart/cart_page.dart';
import 'package:doan_tmdt/screen/home/home_page.dart';
import 'package:doan_tmdt/screen/notification/notification_page.dart';
import 'package:doan_tmdt/screen/profile/profile_page.dart';
import 'package:doan_tmdt/screen/profile/user.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({super.key});

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  int _currentIndex = 0;

  final List _screens = [const HomeScreen(), const CartScreen(), const NotificationScreen(), const ProfileScreen()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
  // lấy dữ liệu user
  //--------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPTFood",style: TextStyle(color: Color.fromRGBO(210, 237, 224, 1),fontSize: 25,fontFamily:'Rufina'),),
        actions: [
          GestureDetector(
            child: ClipOval(
              child: Image.asset(
                "assets/img/logo.jpg",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            onTap: (){},
          )
        ],
        backgroundColor: const Color.fromRGBO(46, 91, 69, 1),
      ),
      body: _screens[_currentIndex],
      drawer: MyDrawer(), // Add the drawer here

      bottomNavigationBar: CurvedNavigationBar(
        
        color: const Color.fromARGB(255, 28, 80, 29),
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color(0xFFD2EDE0),
        animationDuration: const Duration(milliseconds: 500),
        animationCurve: Curves.decelerate,

        items: const <Widget>[
          Icon(Icons.home,color: Color.fromARGB(255, 193, 204, 69),),
          Icon(Icons.shopping_cart,color: Color.fromARGB(255, 193, 204, 69),),
          Icon(Icons.notifications,color: Color.fromARGB(255, 193, 204, 69),),
          Icon(Icons.account_circle_outlined,color: Color.fromARGB(255, 193, 204, 69),),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },


      ),
    );
  }
}
