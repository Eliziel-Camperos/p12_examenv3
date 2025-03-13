import 'package:flutter/material.dart';

// Clase Tienda con sus atributos
class Tienda {
  final int id;
  final String nombre;
  final String direccion;
  final String telefono;
  final String correo;
  final String horario;

  Tienda({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.correo,
    required this.horario,
  });
}

void main() {
  runApp(MyApp()); // Esta línea conecta con la clase MyApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TiendasScreen(), // Conexión con la pantalla principal
    );
  }
}

class TiendasScreen extends StatelessWidget {
  // Lista de tiendas
  final List<Tienda> tiendas = [
    Tienda(
      id: 1,
      nombre: "Tienda A",
      direccion: "Calle 123, Ciudad",
      telefono: "123-456-7890",
      correo: "contacto@tiendaa.com",
      horario: "9:00 AM - 9:00 PM",
    ),
    Tienda(
      id: 2,
      nombre: "Tienda B",
      direccion: "Avenida 456, Ciudad",
      telefono: "987-654-3210",
      correo: "contacto@tiendab.com",
      horario: "10:00 AM - 8:00 PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tiendas"),
        centerTitle: true,
        backgroundColor: Colors.blue, // Navbar de color azul
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
          children: [
            for (int i = 0; i < tiendas.length; i++) ...[
              // Iteración sobre la lista
              TiendaCard(
                  tienda: tiendas[i]), // Conexión con el widget TiendaCard
              if (i < tiendas.length - 1)
                SizedBox(height: 20), // Separador entre tarjetas
            ]
          ],
        ),
      ),
    );
  }
}

class TiendaCard extends StatelessWidget {
  final Tienda tienda;

  TiendaCard({required this.tienda});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
      ),
      elevation: 5, // Sombras
      color: tienda.id == 1
          ? Colors.blue[100]
          : Colors.green[100], // Diferente color
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tienda.nombre,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Dirección: ${tienda.direccion}"),
            Text("Teléfono: ${tienda.telefono}"),
            Text("Correo: ${tienda.correo}"),
            Text("Horario: ${tienda.horario}"),
          ],
        ),
      ),
    );
  }
}
