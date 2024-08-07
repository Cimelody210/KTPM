// màng hình đăng nhập

import 'package:doan_tmdt/auth/firebase_auth.dart';
import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:doan_tmdt/model/err_dialog.dart';
import 'package:doan_tmdt/screen/login/forgot_password_page.dart';
import 'package:doan_tmdt/screen/login/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email =  TextEditingController();
  final TextEditingController password = TextEditingController();
  String TBEmail = "";
  String TBPassword = "";

  var _fireauth1 = FirebAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              image: const AssetImage('assets/img/template.png'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              //* vùng Logo
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(32)),
                Container(
                  child: Image.asset("assets/img/logo.jpg",height: 150,width: MediaQuery.of(context).size.width,),
                ),
                const Text("Đăng Nhập",style: TextStyle(fontSize: 35,color: Color.fromRGBO(210, 237, 224, 1),fontWeight: FontWeight.w500),),

                // * Vùng nhập liệu (Username + Password)
                const Padding(padding: EdgeInsets.all(20)),
                // Username
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(label: Text("Email",style:TextStyle(fontWeight: FontWeight.w500))),
                      ),
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                          Text(TBEmail,style: const TextStyle(color: Colors.red),)
                        ],
                      ),
                    ],
                  )
                ),
                //Password
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(label: Text("Mật khẩu",style:TextStyle(fontWeight: FontWeight.w500))),
                      ),
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                          Text(TBPassword,style: const TextStyle(color: Colors.red),)
                        ],
                      ),
                    ],
                  )
                ),

                // * Vùng nút bấm (Đăng nhập + Đăng ký)
                // Nút đăng nhập
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: (){
                        if(email.text.isEmpty){
                          setState(() {  
                          TBEmail = "Vui lòng nhập Email";
                          });
                        }
                        else {
                          setState(() {  
                          TBEmail = "";
                          });
                        }
                        if(password.text.isEmpty){
                          setState(() {
                            TBPassword = "Vui lòng nhập mật khẩu";
                          });
                        }
                        else {
                          setState(() {  
                          TBPassword = "";
                          });
                        }
                        // đăng nhập thành công
                        try{
                            _fireauth1.signIn(email.text, password.text, (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomNavigator()));
                          },(mss){
                            MsgDialog.ShowDialog(context, 'Sign-In', mss);
                          });
                        }catch(err){
                           print('Error during sign-in: $err');
                           MsgDialog.ShowDialog(context, 'Sign-In', 'Đã có lỗi xảy ra. Vui lòng thử lại sau.');
                        }
                        // if(email.text=="Huan"&& password.text=="123"){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyBottomNavigator()));
                        // }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(120, 120, 120, 1)),
                      ),
                      child: const Text("Đăng nhập",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                    //Nút đăng ký
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                      },
                      child: const Text("Đăng ký",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),)
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(5)),
                //quên mật khẩu
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                  },
                  child: const Text("Quên mật khẩu?",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                )
              ]       
            ),
          ],
        ),
      )
    );
  }
}