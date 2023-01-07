import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState>{
  
  UsuarioCubit() : super( UsuarioInitial() );

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(
        currentState.usuario.nombre, 
        edad, 
        currentState.usuario.profesiones
      );
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final profesiones = [
        ...currentState.usuario.profesiones,
        'Crikoso',
        'Hermoso'
      ];
      final newUser = currentState.usuario.copyWith(
        currentState.usuario.nombre,
        currentState.usuario.edad,
        profesiones
      );
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}