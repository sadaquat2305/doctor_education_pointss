import 'package:doctor_education_pointss/features/auth/domain/entities/user_entity.dart';
import 'package:doctor_education_pointss/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));
    on<AuthSignUp> (_onAuthSignUp);
  }

  void _onAuthSignUp (
      AuthSignUp event ,
      Emitter<AuthState> emit ,
      ) async {

    final res = await _userSignUp.signUpWithEmailPassword(
      UserSignUpParams(name: event.name, password: event.password, email: event.email)

    );

    res.fold((failure) => emit(AuthFailure(failure.message)),
            (user) => emit(AuthSuccess(user: user)));
  }



}
