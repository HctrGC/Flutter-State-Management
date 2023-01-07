import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

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
                final Usuario usuario = Usuario("Juanito", 20, ["Drogadicto", "Chemo"]);
                usuarioCubit.seleccionarUsuario(usuario);
              },
              color: Colors.indigo,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              },
              color: Colors.indigo,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () {
                usuarioCubit.agregarProfesion();
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