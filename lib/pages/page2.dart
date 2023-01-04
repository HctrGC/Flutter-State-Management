import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
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
                
              },
              color: Colors.indigo,
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () {
                print('Holiwis');
              },
              color: Colors.indigo,
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 10),

            MaterialButton(
              onPressed: () {
                
              },
              color: Colors.indigo,
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white))
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina1'),
        child: Icon(Icons.place_rounded)
      )
    );
  }
}