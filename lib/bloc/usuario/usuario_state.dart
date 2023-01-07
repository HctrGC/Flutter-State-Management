part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final bool existeUsuario = false;
}

class UsuarioActivo extends UsuarioState {
  final bool existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}