

import 'package:click_buy/data/model/faliure.dart';
import 'package:click_buy/data/model/request/RegisterRequestBody.dart';
import 'package:click_buy/domain/repos/auth_repo/auth_repo.dart';
import 'package:click_buy/domain/use_cases/register_use_case.dart';
import 'package:click_buy/utilites/base_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit {

  GlobalKey <FormState> globalKey = GlobalKey<FormState>();

  TextEditingController nameController=  TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController RepasswordController=  TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
   RegisterUseCase registerUseCase ;
  RegisterViewModel(this.registerUseCase) : super (BaseInitialStates());

  void Register()async{
    if (!globalKey.currentState!.validate()) return;
    else {
      emit(BaseLoadingStates());
     Either<Failure, bool>  either=  await registerUseCase.execute(RegisterRequestBody(
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text,
          phone: phoneController.text,
          rePassword: RepasswordController.text
      ));
     either.fold((error) => emit(BaseErrorState(error.error))

         , (_) => emit(BaseSuccessState()));
    }

  }





}