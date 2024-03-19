import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../resources/routes_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //late String email, password;

  void signInWithEmailAndPassword(BuildContext context , { required String email,required String password}) {
    emit(SignInLoadingState());

    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {

        if (email == 'dean.account@gmail.com') {
          Navigator.pushReplacementNamed(context, Routes.deanRoute);
        } else if (email == 'vice.account@gmail.com') {
          Navigator.pushReplacementNamed(context, Routes.viceRoute);
        } else {

          Navigator.pushReplacementNamed(context, Routes.staffRoute);
        }
        emit(SignInSuccessState());
      }).catchError((error) {
        emit(SignInErrorState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
