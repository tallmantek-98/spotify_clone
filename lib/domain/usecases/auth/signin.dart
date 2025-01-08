import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/config/usecases/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';

import '../../../data/repository/auth/auth_repository.dart';
import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
