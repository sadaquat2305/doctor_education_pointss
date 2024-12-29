import 'package:doctor_education_pointss/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:doctor_education_pointss/features/auth/data/respository/auth_repository_impl.dart';
import 'package:doctor_education_pointss/features/auth/domain/usecases/user_sign_up.dart';
import 'package:doctor_education_pointss/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: "https://wtzulazvkqykffvbwxoc.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind0enVsYXp2a3F5a2ZmdmJ3eG9jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU0NTk4NjUsImV4cCI6MjA1MTAzNTg2NX0.Xg2-FXzpYGgXbchC-sNmYkBlBmoKCVOvMX3M77scSmY");
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => AuthBloc(
            userSignUp: UserSignUp(
                authRepository: AuthRepositoryImpl(
                    remoteDataSource: AuthRemoteDataSourceImpl(
                        supabaseClient: supabase.client)))))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: SignupPage(),
    );
  }
}
