import 'package:click_buy/ui/screens/auth/signup/sign_up.dart';
import 'package:click_buy/ui/screens/splash/splash_screen.dart';
import 'package:click_buy/utilites/app_assets.dart';
import 'package:click_buy/utilites/app_colors.dart';
import 'package:click_buy/widgets/login_and_signup/custom_text_field.dart';
import 'package:click_buy/widgets/login_and_signup/custome_button.dart';
import 'package:click_buy/widgets/login_and_signup/form_labe_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

 static const String routeName = "LoginScreen";

 TextEditingController emailControler= TextEditingController();
  TextEditingController passwordController= TextEditingController();
 LoginScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primiaryColor,
     body:  SingleChildScrollView(
       child: Padding(
         padding: EdgeInsets.all(12),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: height*0.09,),
             Image.asset(AppAssets.routeIcon),
             SizedBox(height: height*0.05,),
             Align(
                 alignment: Alignment.topLeft,
                 child: Text("Welcome back to route", style: Theme.of(context).textTheme.titleLarge,)),
             SizedBox(height: height*0.01,),
             Align(
                 alignment: Alignment.topLeft,
                 child: Text("please sign in with your email", style: Theme.of(context).textTheme.titleMedium,)),
             SizedBox(height: height*0.04,),
             Align(
                 alignment: Alignment.topLeft,
                 child: FormLabelWidget(label: "Email")),
             SizedBox(height: height*0.02,),
             CustomeTextField(hint: "Enter your Email",
                 textEditingController: emailControler,
                 type: TextInputType.emailAddress,
                 isPassword: false,
                 validator: (name){}),
             SizedBox(height: height*0.04,),
             Align(
                 alignment: Alignment.topLeft,
                 child: FormLabelWidget(label: "Password")),
             SizedBox(height: height*0.02,),
             CustomeTextField(hint: "Enter your Password",
                 textEditingController: passwordController,
                 type: TextInputType.visiblePassword,
                 isPassword: true,
                 validator: (name){}),
             SizedBox(height: height*0.08,),

             CustomButton(text: "Login" , onPressed:  (){}),


             SizedBox(height: height*0.07,),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormLabelWidget(label: "Don't have an account "),
                InkWell(
                    onTap:() {
                      Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
                    },
                    child: FormLabelWidget(label: "Create one ")),

              ],
            )



           ],
         ),
       ),
     ),

    );
  }
}
