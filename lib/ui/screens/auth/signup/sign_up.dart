import 'package:click_buy/utilites/app_assets.dart';
import 'package:click_buy/utilites/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static const String routeName = "SignUpScreen";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: AppColors.primiaryColor,
     body: SingleChildScrollView(
       child: Padding(
         padding: EdgeInsets.all(12),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: height*0.09,),
             Center(child: Image.asset(AppAssets.routeIcon)),

           ],
         ),
       ),
     ),

    );
  }
}
