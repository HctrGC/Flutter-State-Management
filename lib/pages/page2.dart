import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:singleton/controllers/usuario_controller.dart';
import 'package:singleton/models/usuario.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final Usuario newUser = Usuario(
                  nombre: "Juanito",
                  edad: 20
                );
                usuarioCtrl.cargarUsuario(newUser);
                Get.snackbar(
                  "Usuario agregado", 
                  "El usuario se ha agregado correctamente.",
                  backgroundColor: Colors.white,
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              },
              color: Colors.indigo,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () => usuarioCtrl.cambiarEdad(25),
              color: Colors.indigo,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () => usuarioCtrl.agregarProfesion("Profesión #${usuarioCtrl.numeroProfs + 1}"),
              color: Colors.indigo,
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () => Get.changeTheme(ThemeData.dark()),
              color: Colors.indigo,
              child: const Text('Cambiar tema', style: TextStyle(color: Colors.white))
            )
          ]
        )
      )
    );
  }
}