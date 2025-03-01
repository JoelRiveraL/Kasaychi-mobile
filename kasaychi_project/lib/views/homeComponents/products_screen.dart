import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuestros Productos")),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la sección
            const Text(
              "Actividades Económicas\nNuestros Productos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Descripción de la sección
            const Text(
              "Gracias al esfuerzo y la colaboración de nuestra comunidad, hemos logrado impulsar la producción local de productos lácteos de alta calidad. Ahora, orgullosamente ofrecemos una variedad de quesos artesanales, yogures frescos, leche pura y nuestro exclusivo “Pájaro Azul”. Cada producto refleja el compromiso y la dedicación de nuestros miembros, quienes trabajan incansablemente para brindar lo mejor a nuestras familias y vecinos. ¡Juntos, estamos construyendo un futuro más sostenible y saludable para todos! Puedes apoyarnos con la compra de los mismos, ¡Estaremos muy gustosos de atenderte!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Sección de productos
            _buildProductSection(
              "Quesos Artesanales",
              "Nuestros quesos artesanales son elaborados con leche fresca de la más alta calidad. Disponibles en varios sabores: mozzarella, orégano y ají. Cada queso es una obra maestra de sabor y tradición.",
              "assets/images/QUESO.jpg",
              "https://github.com/JoshSy01/T10-ProgressTeam",
            ),
            const SizedBox(height: 20),
            _buildProductSection(
              "Leche",
              "Leche pura y fresca, ordeñada diariamente de nuestras vacas criadas en los verdes pastos andinos. Rica en nutrientes y con un sabor inigualable.",
              "assets/images/LECHE.jpg",
              "https://github.com/ericklasluisa/GestionEstudiantes",
            ),
            const SizedBox(height: 20),
            _buildProductSection(
              "Yogurt Natural",
              "Yogurt cremoso y delicioso, elaborado artesanalmente con nuestra leche fresca. Disponible en varios sabores naturales, sin conservantes artificiales.",
              "assets/images/YOGURT.jpg",
              "https://github.com/LeonardoYaranga/BananaCocktailsTiendaOnlineGrupo4",
            ),
            const SizedBox(height: 20),
            _buildProductSection(
              "Pájaro Azul",
              "Nuestra bebida tradicional, destilada artesanalmente siguiendo recetas ancestrales. Un verdadero tesoro de la cultura ecuatoriana.",
              "assets/images/PAZUL.jpg",
              "https://github.com/LeonardoYaranga/ReactBananaCocktailsGrupo4",
            ),
          ],
        ),
      ),
    );
  }

  // Widget para cada producto
  Widget _buildProductSection(
      String title, String description, String imagePath, String link) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imagePath, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            // Enlace para más información
            InkWell(
              onTap: () {
                // Abre el enlace en el navegador
                // Puedes usar un paquete como url_launcher para abrir los enlaces en un navegador
                print("Abriendo $link");
              },
              child: const Icon(
                Icons.link,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
