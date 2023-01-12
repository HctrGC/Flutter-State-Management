
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/user/user_bloc.dart';
import 'package:singleton/models/usuario.dart';


class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => BlocProvider.of<UserBloc>(context).add(DeleteUser()), 
            icon: const Icon(Icons.exit_to_app)
          )
        ]
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
          ? InformacionUsuario(usuario: state.user!)
          : const Center(
            child: Text("No hay usuario seleccionado"),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({super.key, required this.usuario});

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ListTile( title: Text('Nombre: ${usuario.nombre}') ),
          ListTile( title: Text('Edad: ${usuario.edad}') ),

          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ...usuario.profesiones.map(
            (e) => ListTile(title: Text(e))
          ).toList()
        ],
      ),
    );
  }

}