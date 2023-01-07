import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 1"),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
            icon: const Icon(Icons.exit_to_app)
          )
        ]
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: const Icon(Icons.place_rounded)
      )
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {

        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(child: Text("No hay información del usuario"));

          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
            
          default:
          return const Center(child: Text("Ha habido un problema"));
        }

      }
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key, 
    required this.usuario,
  }) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),

          const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          
          ...usuario.profesiones.map(
            (e) => ListTile(title: Text(e))
          ).toList()
        ]
      )
    );
  }
}