import 'dart:convert';

import 'package:click_buy/data/model/faliure.dart';
import 'package:click_buy/data/model/request/RegisterRequestBody.dart';
import 'package:click_buy/data/model/response/AuthResponse.dart';
import 'package:click_buy/domain/repos/auth_repo/auth_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class AuthRepoImpl extends AuthRepo {

  Future <Either<Failure ,bool>> Login (String email , String password)async{

     ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
     if (connectivityResult==ConnectivityResult.wifi
         || connectivityResult == ConnectivityResult.mobile){
       Uri uri = Uri.https("ecommerce.routemisr.com","/api/v1/auth/signin",);
       Response serverResponse  = await post(uri , body: {
         email:email,
         password:password
       });
       AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(serverResponse.body));
       if (serverResponse.statusCode >=200 && serverResponse.statusCode<300){
         return right(true);
       }else {
         return left(Failure(authResponse.message??"please try again later"));
       }
     }
     else {
       return left(NetworkFailure("please check your internet connection and try again later"));
     }

  }

  @override
  Future<Either<Failure, bool>> Register(RegisterRequestBody requestBody)async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult==ConnectivityResult.wifi
        || connectivityResult == ConnectivityResult.mobile){


      Uri uri = Uri.https("ecommerce.routemisr.com","/api/v1/auth/signup",);
      Response serverResponse  = await post(uri , body: requestBody);


      AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >=200 && serverResponse.statusCode<300){
        return right(true);

      }else {
        return left(Failure(authResponse.message??"please try again later"));
      }
    }
    else {
      return left(NetworkFailure("please check your internet connection and try again later"));
    }
  }
}