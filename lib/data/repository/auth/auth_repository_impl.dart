import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class IAuthRepository extends AuthRepository {
  @override
  Future<Either> signin(SignInUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
