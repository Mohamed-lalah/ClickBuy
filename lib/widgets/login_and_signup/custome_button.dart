import 'package:click_buy/utilites/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 late  String  text ;
 late Function()? onPressed;
   CustomButton({super.key, required this.text ,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398,
      height: 64,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),
          onPressed: onPressed,
          child:Text(text, style: Theme.of(context).textTheme.headlineLarge,
      )

      ),
    );
  }
}
