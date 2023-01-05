import 'package:flutter/material.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/services/usuario_service.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    final Usuario usuario = Usuario(nombre: "");

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          initialData: usuario,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return Container(
              child: (snapshot.data!.nombre != "")
                ? Text(snapshot.data!.nombre)
                : const Text("Página 2"),
            );
          }
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final Usuario usuario = Usuario(nombre: "Juanito", edad: 20, profesiones: ["Crikoso", "Drogadicto", "Marihuano"]);
                usuarioService.cargarUsuario(usuario);
              },
              color: Colors.indigo,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
              color: Colors.indigo,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () {
                
              },
              color: Colors.indigo,
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white))
            )
          ]
        )
      )
    );
  }
}