import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton/pages/page1.dart';
import 'package:singleton/pages/page2.dart';
import 'package:singleton/porviders/usuario_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider())
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