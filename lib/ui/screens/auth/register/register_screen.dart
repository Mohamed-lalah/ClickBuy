import 'package:click_buy/data/repos/auth_repo/auth_repo.dart';
import 'package:click_buy/domain/di/di.dart';
import 'package:click_buy/domain/use_cases/register_use_case.dart';
import 'package:click_buy/ui/screens/auth/login/login_screen.dart';
import 'package:click_buy/ui/screens/auth/register/register_view_model.dart';
import 'package:click_buy/utilites/app_assets.dart';
import 'package:click_buy/utilites/app_colors.dart';
import 'package:click_buy/utilites/base_states.dart';
import 'package:click_buy/utilites/dialog.dart';
import 'package:click_buy/widgets/login_and_signup/custom_text_field.dart';
import 'package:click_buy/widgets/login_and_signup/custome_button.dart';
import 'package:click_buy/widgets/login_and_signup/form_labe_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {

  static const String routeName = "RegisterScreen";
   RegisterViewModel registerViewModel= getIt();
   RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return  BlocListener(
      bloc: registerViewModel,
      listener: (context,state){
        if (state is BaseLoadingStates){
          showMineLoading(context);
        }
        else if (state is BaseErrorState){
          hideLoading(context);
          showErrorDialog(state.error, context);
        }
        else if (state is BaseSuccessState){
         hideLoading(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primiaryColor,
       body:  Column(
         children: [
           SizedBox(height: height*0.08,),
           Image.asset(AppAssets.routeIcon),
           Expanded(
             child: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               child: Padding(
                 padding: EdgeInsets.all(12),
                 child: Form(
                   key: registerViewModel.globalKey,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Align(
                           alignment: Alignment.topLeft,
                           child: FormLabelWidget(label: "Full Name")),
                       SizedBox(height: height*0.02,),
                       CustomeTextField(hint: "Enter your Full Name",
                           textEditingController: registerViewModel.nameController,
                           type: TextInputType.emailAddress,
                           isPassword: false,
                           validator: (name){
                             if (name == null ||  name.trim().isEmpty){
                               return "Please Enter Your Name ";
                             }
                             return null;
                           }),
                       SizedBox(height: height*0.04,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: FormLabelWidget(label: "Mobile Number")),
                       SizedBox(height: height*0.02,),
                       CustomeTextField(hint: "Enter your Mobile Number",
                           textEditingController: registerViewModel.phoneController,
                           type: TextInputType.emailAddress,
                           isPassword: false,
                           validator: (number){
                             if (number == null ||  number.trim().isEmpty){
                               return "Please Enter Your Number ";
                             }
                             if (number.trim().length<11){
                               return "Phone Number Should be at least 10 numbers";
                             }
                             return null;

                           }),
                       SizedBox(height: height*0.04,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: FormLabelWidget(label: "E-mail address")),
                       SizedBox(height: height*0.02,),
                       CustomeTextField(hint: "Enter your Email address",
                           textEditingController: registerViewModel.emailController,
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
                           textEditingController: registerViewModel.passwordController,
                           type: TextInputType.emailAddress,
                           isPassword: false,
                           validator: (password){
                             if (password == null ||  password.trim().isEmpty){
                               return "Please Enter Password";
                             }
                             if (password.length < 6 ){
                               return "Password should be at least  6  characters";
                             }
                             return null;
                           }),
                       SizedBox(height: height*0.04,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: FormLabelWidget(label: " RePassword")),
                       SizedBox(height: height*0.02,),
                       CustomeTextField(hint: "Enter your re Password",
                           textEditingController: registerViewModel.RepasswordController,
                           type: TextInputType.emailAddress,
                           isPassword: false,
                           validator: (password){
                             if (password == null ||  password.trim().isEmpty){
                               return "Please Enter Password";
                             }
                             if (registerViewModel.passwordController.text !=password){
                               return "Password doesnot match";
                             }
                             return null;


                           }),
                       SizedBox(height: height*0.04,),
                       CustomButton(text: "SignUp" , onPressed:  (){
                         registerViewModel.Register();

                       }),

                     ],
                   ),
                 ),
               ),
             ),
           ),


         ],
       )


      ),

    );
  }
}
