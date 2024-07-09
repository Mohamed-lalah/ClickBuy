import 'package:click_buy/ui/screens/auth/login/login_screen.dart';
import 'package:click_buy/utilites/app_assets.dart';
import 'package:click_buy/utilites/app_colors.dart';
import 'package:click_buy/widgets/login_and_signup/custom_text_field.dart';
import 'package:click_buy/widgets/login_and_signup/custome_button.dart';
import 'package:click_buy/widgets/login_and_signup/form_labe_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static const String routeName = "SignUpScreen";
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: AppColors.primiaryColor,
     body: SingleChildScrollView(
       physics: BouncingScrollPhysics(),
       child: Padding(
         padding: EdgeInsets.all(12),
         child: Form(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SizedBox(height: height*0.09,),
               Image.asset(AppAssets.routeIcon),
               SizedBox(height: height*0.02,),
               Align(
                   alignment: Alignment.topLeft,
                   child: FormLabelWidget(label: "Full Name")),
               SizedBox(height: height*0.02,),
               CustomeTextField(hint: "Enter your Full Name",
                   textEditingController: fullNameController,
                   type: TextInputType.emailAddress,
                   isPassword: false,
                   validator: (name){}),
               SizedBox(height: height*0.04,),
               Align(
                   alignment: Alignment.topLeft,
                   child: FormLabelWidget(label: "Mobile Number")),
               SizedBox(height: height*0.02,),
               CustomeTextField(hint: "Enter your Mobile Number",
                   textEditingController: mobileNumberController,
                   type: TextInputType.emailAddress,
                   isPassword: false,
                   validator: (name){}),
               SizedBox(height: height*0.04,),
               Align(
                   alignment: Alignment.topLeft,
                   child: FormLabelWidget(label: "E-mail address")),
               SizedBox(height: height*0.02,),
               CustomeTextField(hint: "Enter your Email address",
                   textEditingController: fullNameController,
                   type: TextInputType.emailAddress,
                   isPassword: false,
                   validator: (name){}),
               SizedBox(height: height*0.04,),
               Align(
                   alignment: Alignment.topLeft,
                   child: FormLabelWidget(label: "Password")),
               SizedBox(height: height*0.02,),
               CustomeTextField(hint: "Enter your Password",
                   textEditingController: fullNameController,
                   type: TextInputType.emailAddress,
                   isPassword: false,
                   validator: (name){}),
               SizedBox(height: height*0.04,),
               CustomButton(text: "SignUp" , onPressed:  (){
                 Navigator.pushReplacementNamed(context, LoginScreen.routeName);
               }),

             ],
           ),
         ),
       ),
     ),

    );
  }
}
