import 'package:click_buy/data/repos/auth_repo/auth_repo.dart';

class LoginUseCase {

 late  AuthRepo authRepo;


 LoginUseCase(this.authRepo);

  void execute (String email , String Password){
   authRepo.Login(email, Password);

  }
}