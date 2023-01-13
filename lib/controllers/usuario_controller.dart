import 'package:get/get.dart';
import 'package:singleton/models/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  int get numeroProfs{
    return usuario.value.profesiones!.length;
  }

  void cargarUsuario(Usuario user) {
    existeUsuario.value = true;
    usuario.value = user;
  }

  void cambiarEdad(int age) {
    usuario.update((val) {
      val!.edad = age;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...?val.profesiones, profesion];
    });
  }
}