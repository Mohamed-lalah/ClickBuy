import 'package:click_buy/utilites/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoading (BuildContext context){

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_){
        return const CupertinoAlertDialog(
          content: Row(
            children: [
              Text("Loading...", style: TextStyle(fontSize: 20, color: AppColors.primiaryColor),),
              Spacer(),
              CircularProgressIndicator(color: AppColors.primiaryColor,),
            ],
          ),
        );
      });
}

void hideLoading (BuildContext context){
  Navigator.pop(context);
}

void showErrorDialog(String message , BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_){
        return  CupertinoAlertDialog(
          title: const Text("Error!", style: TextStyle(
            color: Colors.red
          ),),
          content: Text(message, style: TextStyle(fontSize: 20),),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],

        );
      });

}