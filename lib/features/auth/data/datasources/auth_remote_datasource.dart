import 'package:doctor_education_pointss/core/error/exceptions.dart';
import 'package:doctor_education_pointss/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {

  Future<UserModel> signUpWithEmailPassword({

    required String name,
    required String email,
    required String password
});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final SupabaseClient supabaseClient ;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<UserModel> signUpWithEmailPassword({ required String name, required String email, required String password,}) async{

    try {
      final response = await supabaseClient.auth.signUp(password: password,email: email , data: {
        'name': name
      },);
      if (response.user == null ) {
        throw ServerException('User is null!');
      }
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.toString());
    }
  }


}