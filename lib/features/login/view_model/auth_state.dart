part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class SignInLoadingState extends AuthState{}
class SignInSuccessState extends AuthState{}
class SignInErrorState extends AuthState{}
