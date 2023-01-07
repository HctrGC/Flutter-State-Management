import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/pages/page1.dart';
import 'package:singleton/pages/page2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Singleton',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Page1(),
          'pagina2': (_) => const Page2()
        },
      ),
    );
  }
}