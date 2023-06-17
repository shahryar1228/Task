import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:heroicons/heroicons.dart';

class MessageUtils{

  static void showToast(String title,bool isError){
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError?Colors.red:Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
    );
  }
  static void showSnackBar(context,String title,bool isError){
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isError?Colors.red:Colors.green,
      duration: Duration(seconds: 3),
      content: Row(
      children: [
        Expanded(child: Text(title,textDirection: TextDirection.rtl,)),
        SizedBox(width: 16,),
        // HeroIcon(isError?HeroIcons.exclamation:HeroIcons.save,color: Colors.white,)
      ],
    ),),);
  }
}