import 'package:click_buy/data/repos/auth_repo/auth_repo.dart';
import 'package:click_buy/domain/use_cases/login_use_case.dart';
import 'package:click_buy/ui/screens/auth/login/login_view_model.dart';
import 'package:click_buy/ui/screens/auth/signup/sign_up.dart';
import 'package:click_buy/ui/screens/splash/splash_screen.dart';
import 'package:click_buy/utilites/app_assets.dart';
import 'package:click_buy/utilites/app_colors.dart';
import 'package:click_buy/utilites/base_states.dart';
import 'package:click_buy/utilites/dialog.dart';
import 'package:click_buy/widgets/login_and_signup/custom_text_field.dart';
import 'package:click_buy/widgets/login_and_signup/custome_button.dart';
import 'package:click_buy/widgets/login_and_signup/form_labe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {

 static const String routeName = "LoginScreen";


 LoginViewModel loginViewModel = LoginViewModel(LoginUseCase(AuthRepoImpl()));

 LoginScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primiaryColor,
     body:  BlocListener(
       bloc:  loginViewModel,
       child: SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.all(12),
           child: Form(
             key: loginViewModel.formKey,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(height: height*0.09,),
                 Image.asset(AppAssets.logoRoute),
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
                     textEditingController: loginViewModel.emailController,
                     type: TextInputType.emailAddress,
                     isPassword: false,
                     validator: (text){
                       if (text == null ||  text.trim().isEmpty){
                         return "Please Enter Email";
                       }

                       final bool emailValid =
                       RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                           .hasMatch(text);
                       if (!emailValid){
                         return "please enter a valid email";
                       }
                       return null;

                     }),
                 SizedBox(height: height*0.04,),
                 Align(
                     alignment: Alignment.topLeft,
                     child: FormLabelWidget(label: "Password")),
                 SizedBox(height: height*0.02,),
                 CustomeTextField(hint: "Enter your Password",
                     textEditingController: loginViewModel.passwordController,
                     type: TextInputType.visiblePassword,
                     isPassword: true,
                     validator: (password){
                       if (password == null ||  password.trim().isEmpty){
                         return "Please Enter Password";
                       }
                       if (password.length < 6 ){
                         return "Password should be at least  6  characters";
                       }
                       return null;

                     }),
                 SizedBox(height: height*0.08,),
                 CustomButton(text: "Login" , onPressed:  (){
                   loginViewModel.Login();
                 }),
                 SizedBox(height: height*0.07,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     FormLabelWidget(label: "Don't have an account ? "),
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
       ),
       listener: (context ,state){
         if (state is BaseLoadingStates) {
           showMineLoading(context);
         }

         else if (state is BaseErrorState) {
           Navigator.pop(context);
           showErrorDialog(state.error, context);
         }
       },

     ),

    );
  }


}
