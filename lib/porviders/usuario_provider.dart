import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UsuarioProvider with ChangeNotifier {
  Usuario _usuario = Usuario("", 0, []);

  Usuario get usuario => _usuario;
  bool get existeUsuario => _usuario.nombre != "" ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int age) {
    _usuario.edad = age;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario.nombre = "";
    notifyListeners();
  }

  void agregarProfesiones() {
    _usuario.profesiones.add("Profesión #${_usuario.profesiones.length + 1}");
    notifyListeners();
  }
}