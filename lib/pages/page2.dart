import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:singleton/bloc/user/user_bloc.dart';
import 'package:singleton/models/usuario.dart';


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: () {

                final Usuario newUser = Usuario(
                  nombre: "Juanito",
                  edad: 20,
                  profesiones: ["Criko"]
                );
                userBloc.add(ActivateUser(newUser));
              },
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) )
            ),
            const SizedBox(height: 10),

            MaterialButton(
              color: Colors.blue,
              onPressed: () => userBloc.add(ChangeUserAge(30)),
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
            ),
            const SizedBox(height: 10),

            MaterialButton(
              color: Colors.blue,
              onPressed: () => userBloc.add(AddUserProfession(const ["Pocho", "Drogo"])),
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
            )

          ]
        )
     ),
   );
  }
}