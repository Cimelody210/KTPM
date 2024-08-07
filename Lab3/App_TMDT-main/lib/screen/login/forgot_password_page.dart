// màng hình đăng nhập

import 'dart:async';

import 'package:doan_tmdt/model/bottom_appar.dart';
import 'package:doan_tmdt/model/err_dialog.dart';
import 'package:doan_tmdt/screen/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController email =  TextEditingController();
  final TextEditingController otp = TextEditingController();
  String TBEmail = "";
  String TBOTP = "Gửi mã";
  bool isOTPSender = false;

  //----
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('Đã gửi email đặt lại mật khẩu');
    } catch (e) {
      print('Lỗi khi gửi email đặt lại mật khẩu: $e');
      // Xử lý lỗi tại đây
    }
  }
  bool isValidGmail(String input) {
      // Biểu thức chính quy kiểm tra xem chuỗi là địa chỉ email Gmail hợp lệ hay không
      final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
      return regex.hasMatch(input);
  }
  //--------
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
                  child: Image.asset("assets/img/small_logo.png",height: 150,width: MediaQuery.of(context).size.width,),
                ),
                const Text("Quên mật khẩu",style: TextStyle(fontSize: 35,color: Color.fromRGBO(210, 237, 224, 1),fontWeight: FontWeight.w500),),

                // * Vùng nhập liệu (Username + otp)
                const Padding(padding: EdgeInsets.all(20)),
                
                // Username
                Container(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/7, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.4,
                        child: Column(
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
                      //otp
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: MediaQuery.of(context).size.width/2,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           TextField(
                      //             keyboardType: TextInputType.number,
                      //             maxLength: 6,
                      //             controller: otp,
                      //             decoration: const InputDecoration(label: Text("Mã xác nhận",style:TextStyle(fontWeight: FontWeight.w500))),
                      //           ),
                      //         ],
                      //       )
                      //     ),
                      //     Padding(padding: EdgeInsets.fromLTRB(22, 0, 0, 0)),
                      //     GestureDetector(
                      //       onTap: (){
                      //         setState(() {
                      //           if(email.text.isEmpty){
                      //             TBEmail = "Vui lòng nhập Email";
                      //           }
                      //           else{
                      //             isOTPSender = true;
                      //             TBEmail ="";
                      //           }
                      //           if(isOTPSender){
                      //             Timer.periodic(const Duration(seconds: 59),(timer){
                      //               TBOTP = "Chờ ${timer.tick}s";
                      //               if(timer.tick==0){
                      //                 TBOTP = "Gửi lại";
                      //                 isOTPSender = false;
                      //               }
                      //             });
                      //           }
                      //         });
                      //       },
                      //       child: Text(TBOTP,style: TextStyle(color: Color.fromRGBO(14, 52, 201, 1),fontWeight: FontWeight.bold),),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
                
                // * Vùng nút bấm (Xác nhận + Đăng nhập)
                // Nút xác nhận
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: (){
                        //todo: xác nhận 
                        if(email.text == '')
                        {
                          MsgDialog.ShowDialog(context, 'Sign-In', 'Vui lòng nhập gmail');
                        }else if(isValidGmail(email.text) == false){
                           MsgDialog.ShowDialog(context, 'Sign-In', 'Gmail không đúng định dạng. vui lòng nhập lại.!');
                        }else{
                           resetPassword(email.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        }
                       
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(120, 120, 120, 1)),
                      ),
                      child: const Text("Xác nhận",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                    //Nút đăng nhập
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Đăng nhập",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),)
                    )
                  ],
                ),
                
              ]       
            ),
          ],
        ),
      ),
    );
  }
}