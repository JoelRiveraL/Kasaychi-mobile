import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasaychi_project/views/homeComponents/interactiveImageCard.dart';
import 'package:kasaychi_project/widgets/reviews_widget.dart'; // Importa el widget de reseñas
class ProductsScreen extends StatelessWidget {
   final String siteId; // Añadimos siteId como parámetro

  const ProductsScreen({super.key, required this.siteId}); // Requiere siteId 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        toolbarHeight: 85,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/KasaychiKunapak.png",
              width: 65,
              height: 65,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                "  Nuestros Productos",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              

              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Actividades Económicas",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const Text(
                      "Nuestros Productos",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Gracias al esfuerzo y la colaboración de nuestra comunidad, hemos logrado impulsar la producción local de productos lácteos de alta calidad. Ahora, orgullosamente ofrecemos una variedad de quesos artesanales, yogures frescos, leche pura y nuestro exclusivo “Pájaro Azul”. Cada producto refleja el compromiso y la dedicación de nuestros miembros, quienes trabajan incansablemente para brindar lo mejor a nuestras familias y vecinos. ¡Juntos, estamos construyendo un futuro más sostenible y saludable para todos! Puedes apoyarnos con la compra de los mismos, ¡Estaremos muy gustosos de atenderte!s",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 25),
                    

                    Column(
                      children: [
                        InteractiveImageCard(
                          imagePath: "assets/images/QUESO.jpg",
                          title: "Quesos Artesanales",
                          description: "Nuestros quesos artesanales son elaborados con leche fresca de la más alta calidad. Disponibles en varios sabores: mozzarella, orégano y ají. Cada queso es una obra maestra de sabor y tradición. ¡Pregunta por ellos!",
                        ),
                        const SizedBox(height: 15),
                        InteractiveImageCard(
                          imagePath: "assets/images/LECHE.jpg",
                          title: "Leche",
                          description: "Leche pura y fresca, ordeñada diariamente de nuestras vacas criadas en los verdes pastos andinos. Rica en nutrientes y con un sabor inigualable.",
                        ),
                        const SizedBox(height: 15),
                        InteractiveImageCard(
                          imagePath: "assets/images/YOGURT.jpg",
                          title: "Yogurt Natural",
                          description: "Yogurt cremoso y delicioso, elaborado artesanalmente con nuestra leche fresca. Disponible en varios sabores naturales, sin conservantes artificiales.",
                        ),
                        const SizedBox(height: 15),
                        InteractiveImageCard(
                          imagePath: "assets/images/PAZUL.jpg",
                          title: "Pájaro Azul",
                          description: "Nuestra bebida tradicional, destilada artesanalmente siguiendo recetas ancestrales. Un verdadero tesoro de la cultura ecuatoriana.",
                        ),
                        const SizedBox(height: 15),
                        InteractiveImageCard(
                          imagePath: "assets/images/Carrito.jpg",
                          title: "Carrito de Compras",
                          description: "Nuestra Tienda Online está por venir, ¡Estamos trabajando en ello! Mientras tanto, puedes contactarnos para realizar tu pedido.",
                        ),
                        const SizedBox(height: 25),
                        Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: ReviewsWidget(siteId: siteId), // Añadimos el widget de reseñas
              ),
                      ],
                    ),
                  ],
                ),
              ),

              

            ],
          ),
        ),
      ),
    );
  }

  

}