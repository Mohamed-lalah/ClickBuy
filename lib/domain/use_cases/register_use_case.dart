import 'package:click_buy/data/model/faliure.dart';
import 'package:click_buy/data/model/request/RegisterRequestBody.dart';
import 'package:click_buy/domain/repos/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterUseCase {

 late  AuthRepo authRepo ;
 RegisterUseCase(this.authRepo);


 Future <Either<Failure,bool>> execute (RegisterRequestBody requestBody)async{
   return authRepo.Register(requestBody);
 }
}