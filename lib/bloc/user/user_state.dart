part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario? user;

  const UserState({
    this.existUser = false, 
    this.user
  }); 
}

class UserInitialState extends UserState {
  UserInitialState(): super(existUser: false, user: Usuario(nombre: "", edad: 0, profesiones: []));
}

class ActivatedUserState extends UserState {
  final Usuario newUser;
  const ActivatedUserState(this.newUser) : super(existUser: true, user: newUser);
}