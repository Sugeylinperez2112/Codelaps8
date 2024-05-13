import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // Tema oscuro
        scaffoldBackgroundColor: Colors.black, // Fondo oscuro
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Colors.white), // Texto blanco
              bodyMedium: const TextStyle(color: Colors.white), // Texto blanco
            ),
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imagen1.png', // Ruta relativa de la imagen de fondo de la AppBar (Bosque)
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black.withOpacity(
                          0.5), // Color de fondo oscuro para superponer sobre la imagen
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        'HorizonsApp', // Nombre de la aplicación
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // Texto blanco
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildListItem(context, index);
                },
                childCount: 5, // Limita la lista a 5 lugares turísticos
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    // Lista de lugares turísticos con fechas, descripciones y temperaturas
    List<String> lugares = [
      'Cascada Blanca',
      'Zoológico Nica',
      'Pochomil',
      'San Juan del Sur',
      'Masaya',
    ];

    List<String> fechas = [
      '12 de mayo de 2024',
      '18 de junio de 2024',
      '5 de julio de 2024',
      '22 de agosto de 2024',
      '10 de septiembre de 2024',
    ];

    List<String> descripciones = [
      'Una hermosa cascada en las montañas con aguas cristalinas.',
      'Un zoológico con una gran variedad de animales exóticos y actividades interactivas.',
      'Una playa paradisíaca muy transcurrida.',
      'Playa de visitas extranjeras',
      'Parques, mercados, museos y lagunas',
    ];

    List<int> temperaturas = [
      28, // Temperatura para Cascada Blanca
      30, // Temperatura para Zoológico Nica
      32, // Temperatura para Pochomil
      29, // Temperatura para San Juan del Sur
      31, // Temperatura para Masaya
    ];

    // Asegúrate de que el índice esté dentro del rango de lugares, fechas, descripciones y temperaturas
    if (index >= lugares.length ||
        index >= fechas.length ||
        index >= descripciones.length ||
        index >= temperaturas.length) {
      return const SizedBox(); // Retorna un contenedor vacío si el índice está fuera de rango
    }

    return GestureDetector(
      onTap: () {
        _showImageCarousel(context, index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white), // Bordes con líneas blancas
        ),
        child: ListTile(
          leading: Image.asset(
            'assets/lugar${index + 1}.png', // Ruta relativa de la imagen del lugar turístico
            width: 50,
            height: 50,
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
          ),
          title: Text(lugares[index]),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fecha: ${fechas[index]}'),
              Text(descripciones[index]),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '${temperaturas[index]}°C',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void _showImageCarousel(BuildContext context, int index) {
    // Aquí mostramos el carrusel de imágenes usando carousel_slider
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: CarouselSlider(
          items: [
            Image.asset('assets/lugar${index + 1}_imagen1.png'),
            Image.asset('assets/lugar${index + 1}_imagen2.png'),
            // Agrega más imágenes según sea necesario
          ],
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
        ),
      ),
    ));
  }
}
