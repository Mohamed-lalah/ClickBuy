import 'package:click_buy/data/model/faliure.dart';
import 'package:click_buy/data/repos/auth_repo/auth_repo.dart';
import 'package:click_buy/domain/repos/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {

 late  AuthRepo authRepo;
 LoginUseCase(this.authRepo);

  Future <Either <Failure,bool>> execute (String email, String password ){
   return  authRepo.Login(email,password);

  }
}
