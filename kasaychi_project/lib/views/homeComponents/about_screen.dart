import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasaychi_project/views/homeComponents/about_screen.dart';
import 'package:kasaychi_project/views/homeComponents/activity_screen.dart';
import 'package:kasaychi_project/views/homeComponents/contact_screen.dart';
import 'package:kasaychi_project/views/homeComponents/multimedia_screen.dart';
import 'package:kasaychi_project/views/homeComponents/products_screen.dart';
import 'package:kasaychi_project/views/homeComponents/map_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                "  Quienes Somos",
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
                      "Sobre Nosotros",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    const SizedBox(height: 15),
                    

                    Column(
                      children: [
                        _buildServiceCard(
                          FontAwesomeIcons.handshake,
                          "Identidad y Valores",
                          "Somos la comunidad Los Casaichis, un pueblo arraigado en la provincia de Bolívar, Ecuador, que preserva con orgullo su herencia indígena Panzalea y Yacoto. Nuestra identidad se nutre de valores ancestrales como la solidaridad, la reciprocidad y el trabajo colectivo (minga), pilares que guían nuestra vida comunitaria."
                        ),
                        const SizedBox(height: 15),
                        _buildServiceCard(
                          FontAwesomeIcons.bullseye,
                          "Misión",
                          "Promover el desarrollo sostenible de nuestra comunidad mediante la revitalización de nuestra cultura, la protección de nuestro entorno natural y la creación de experiencias turísticas que respeten nuestra tierra y población."
                        ),
                        const SizedBox(height: 15),
                        _buildServiceCard(
                          FontAwesomeIcons.lightbulb,
                          "Visión",
                          "Ser un referente nacional de turismo comunitario indígena, donde los valores culturales, la biodiversidad y la organización colectiva sean motores de bienestar, educación y orgullo para las futuras generaciones."
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

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color.fromARGB(255, 255, 102, 0), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: FaIcon(
          icon,
          size: 30,
          color: const Color.fromARGB(255, 255, 102, 0),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String imagePath, String title, String description) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(imagePath, height: 110, fit: BoxFit.cover, ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Espaciado exterior
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Espaciado interno uniforme
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(icon, size: 50, color: Color.fromARGB(255, 255, 102, 0)), // Ícono principal centrado
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 102, 0),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }


  Widget _buildGallerySection() {
    List<Map<String, String>> images = [
      {'path': 'assets/images/mision.jpg', 'title': 'Miembros de la Comunidad', 'desc': 'Reunión de miebros en el campo Casaichis San Antonio'},
      {'path': 'assets/images/fondoLejanoCalle.jpg', 'title': 'Paisaje Comunidad Kasaychi', 'desc': 'Imagen del paisaje de llegada a la comunidad'},
      {'path': 'assets/images/fondoLejanoCalle3.jpg', 'title': 'Paisaje UEIB Inti Churi', 'desc': 'Paisaje con escuela bilingüe de la comunidad'},
      {'path': 'assets/images/childsEscuela.jpg', 'title': 'Niños en la escuela UEIB Inti Churi', 'desc': 'Comunidad Estudiantil Kasaychi disfrutando evento'},
      {'path': 'assets/images/fondoEscuela.jpg', 'title': 'Escuela', 'desc': 'Escuela Vista desde un plano 3/4'},
      {'path': 'assets/images/AulasEscuela.jpg', 'title': 'Viviendas de la Comunidad', 'desc': 'Viviendas de la comunidad, aledañas a la escuela'},
      {'path': 'assets/images/childsInWoodPlatform.jpg', 'title': 'Niños en Centro Ecoturistico TINKU ', 'desc': 'Estudiantes disfrutando salida educativa'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: images.map((image) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10), 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 180, 
                width: double.infinity, 
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        image['path']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 55, 
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              image['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              image['desc']!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }








  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir $url';
    }
  }
}
