import 'package:click_buy/utilites/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class myTheme {


 static ThemeData lightThem =ThemeData(
   primaryColor:  AppColors.primiaryColor,
   textTheme: TextTheme(
     titleLarge:GoogleFonts.poppins(
       textStyle: const TextStyle(
         color: Colors.white,
         fontSize: 24,
         fontWeight: FontWeight.w600
       )
     ),/// welcome

       titleSmall:GoogleFonts.poppins(
           textStyle: const TextStyle(
               color: AppColors.white,
               fontSize: 18,
               fontWeight: FontWeight.w500
           )
       ),/// form label widget

       titleMedium:GoogleFonts.poppins(
           textStyle: const TextStyle(
               color: Colors.white,
               fontSize: 16,
               fontWeight: FontWeight.w300
           )
       ),/// please sign with email

       displayMedium:GoogleFonts.poppins(
           textStyle: const TextStyle(
               color:Color(0xff000000),
               fontSize: 18,
               fontWeight: FontWeight.w300
           )
       ),/// hint

     headlineLarge:GoogleFonts.poppins(
         textStyle: const TextStyle(
             color: AppColors.primiaryColor,
             fontSize: 20,
             fontWeight: FontWeight.w500
         )
     ),///elevated button

     )
   );



}