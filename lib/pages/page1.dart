import 'package:flutter/material.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/services/usuario_service.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {

    final Usuario usuario = Usuario(nombre: "");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 1"),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        initialData: usuario,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.data!.nombre != ""
          ? InformacionUsuario(usuario: snapshot.data!)
          : const Center(
              child: Text("No hay información del usuario")
        );
        },
      ),
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
          Container(
            height: usuario.profesiones!.length * 60,
            child: ListView.builder(
              itemCount: usuario.profesiones!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Profesión ${index+1}: ${usuario.profesiones![index]}'));
              },
            ),
          ),
        ]
      )
    );
  }
}