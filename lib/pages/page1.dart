import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton/controllers/usuario_controller.dart';
import 'package:singleton/models/usuario.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 1"),
      ),
      body: Obx(
        () => usuarioCtrl.existeUsuario.value 
          ? InformacionUsuario(usuario: usuarioCtrl.usuario.value)
          : const Center(child: Text('No se ha seleccionado un usuario.')),    
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('pagina2', arguments: {
          'nombre': "Juanito",
          'edad': 20
        }),
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
          
          ...usuario.profesiones!.map((e) => ListTile(title: Text(e)))
        ]
      )
    );
  }
}