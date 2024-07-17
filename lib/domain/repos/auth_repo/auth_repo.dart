
import 'package:click_buy/data/model/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future <Either<Failure, bool>> Login (String email , String password);
}

