import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/porviders/usuario_provider.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    
    final usuarioService = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 1"),
        actions: [
          IconButton(
            onPressed: usuarioService.removerUsuario, 
            icon: const Icon(Icons.cancel)
          )
        ],
      ),
      body: (usuarioService.existeUsuario)
      ? InformacionUsuario(usuario: usuarioService.usuario)
      : const Center(child: Text("No hay usuario seleccionado")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: const Icon(Icons.place_rounded)
      )
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
    return Container(
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
          // Los 3 ... son la desestructuración de cada uno de los elementos de un arreglo de manera individual
          ...usuario.profesiones.map((e) => ListTile(title: Text(e)))
        ]
      )
    );
  }
}