import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/porviders/usuario_provider.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario 
        ? Text(usuarioService.usuario.nombre)
        : const Text("Página 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = Usuario("Juanito", 20, ["Arquitecto", "Médico"]);
                usuarioService.usuario = newUser;
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
                usuarioService.agregarProfesiones();
              },
              color: Colors.indigo,
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white))
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina1'),
        child: const Icon(Icons.place_rounded)
      )
    );
  }
}