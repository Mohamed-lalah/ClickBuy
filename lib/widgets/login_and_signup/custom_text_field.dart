import 'package:click_buy/utilites/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  late String hint ;
  late TextEditingController textEditingController ;
  late TextInputType type;
  late bool isPassword ;
  late String? Function  (String ?) validator ;

  CustomeTextField(

  {
    required this.hint,
    required this.textEditingController,
    required this.type,
     required this.isPassword ,
  required this.validator});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
          disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
          errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
          focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: AppColors.white,
        filled: true,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.displayMedium,
      ),
      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),
      validator:validator,
      keyboardType: type,
      controller: textEditingController,
      obscureText: isPassword,

    );
  }
}
