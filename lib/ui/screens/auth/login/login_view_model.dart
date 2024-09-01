import 'package:click_buy/data/model/faliure.dart';
import 'package:click_buy/data/repos/auth_repo/auth_repo.dart';
import 'package:click_buy/domain/use_cases/login_use_case.dart';
import 'package:click_buy/ui/screens/auth/login/login_view_model.dart';
import 'package:click_buy/utilites/base_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit {


  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController=  TextEditingController();
  TextEditingController passwordController= TextEditingController();
  LoginUseCase loginUseCase ;

  LoginViewModel(this.loginUseCase) : super (BaseInitialStates());


  void Login ()async{
      if (!formKey.currentState!.validate()) return ;
      emit(BaseLoadingStates());
     Either <Failure, bool > response = await
     loginUseCase.execute(emailController.text, passwordController.text);
     response.fold  ((error) {
         emit(BaseErrorState(error.error));} ,
             (succes) {
         emit(BaseSuccessState());
             } );
      
  }



}
