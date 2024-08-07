import 'package:flutter/material.dart';

class MsgDialog{
  static void ShowDialog(BuildContext context, String title, String msg){
    showDialog(context: context, builder: (context) =>AlertDialog(
      title: Text(title,style: TextStyle(color: const Color.fromARGB(255, 207, 119, 112)),),
      content: Text(msg,style: TextStyle(color:Colors.white),),
      actions: [
        FloatingActionButton(onPressed:(){
          Navigator.of(context).pop(MsgDialog);
        },
        child: Text('Ok',style: TextStyle(color: const Color.fromARGB(255, 51, 0, 0)),),
        )
      ],
      backgroundColor: Color.fromRGBO(46, 91, 69, 1),
    ));
  }
}