import 'package:doctor_education_pointss/features/auth/domain/entities/user_entity.dart';
import 'package:doctor_education_pointss/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

class UserSignUp {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});

  Future<Either<Failure, UserEntity>> signUpWithEmailPassword(
      UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String password;
  final String email;

  UserSignUpParams({
    required this.name,
    required this.password,
    required this.email,
  });
}
