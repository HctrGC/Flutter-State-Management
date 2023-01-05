import 'dart:async';

import 'package:singleton/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario = Usuario(nombre: "");

  final StreamController<Usuario> _usuarioStreamController = StreamController.broadcast();
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  Usuario get usuario => _usuario;
  bool get existeUsuario => (_usuario.nombre != "") ? true : false;

  void cargarUsuario( Usuario user ) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad( int edad ) {
    _usuario.edad = edad;
    _usuarioStreamController.add(_usuario);
  }
}

final usuarioService = _UsuarioService();