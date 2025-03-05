import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasaychi_project/views/homeComponents/about_screen.dart';
import 'package:kasaychi_project/views/homeComponents/activity_screen.dart';
import 'package:kasaychi_project/views/homeComponents/contact_screen.dart';
import 'package:kasaychi_project/views/homeComponents/multimedia_screen.dart';
import 'package:kasaychi_project/views/homeComponents/products_screen.dart';
import 'package:kasaychi_project/views/homeComponents/map_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kasaychi"),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "Menú Principal",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text("Acerca de"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutScreen())),
            ),
            ListTile(
              title: const Text("Actividades"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivitiesScreen())),
            ),
            ListTile(
              title: const Text("Productos"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductsScreen())),
            ),
            ListTile(
              title: const Text("Multimedia"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MultimediaSection())),
            ),
            ListTile(
              title: const Text("Contáctanos"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactPage())),
            ),
            ListTile(
              title: const Text("Mapa"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MultiMapScreen())),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/mainImg1.png"),
              const SizedBox(height: 20),
              const Text(
                "Bienvenido a",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Comunidad Kasaychi",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "La Comunidad Kasaychi es una comunidad indígena ubicada en la provincia de Guaranda, Ecuador. Fundada formalmente bajo el nombre Fundación Kasaychi Runakunapak Tantari 'Inti Churi' el 19 de junio de 1992, la comunidad tiene una rica historia que se remonta a los esfuerzos colectivos para mejorar la calidad de vida de sus habitantes a través de proyectos como la construcción de canales de riego, la unificación de escuelas, y la ampliación de la oferta educativa.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Sección de Redes Sociales
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(
                      FontAwesomeIcons.twitter, "https://twitter.com/"),
                  const SizedBox(width: 15),
                  _buildSocialIcon(
                      FontAwesomeIcons.instagram, "https://www.instagram.com/"),
                  const SizedBox(width: 15),
                  _buildSocialIcon(
                      FontAwesomeIcons.facebook, "https://www.facebook.com/"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para íconos de redes sociales
  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, size: 30, color: Colors.green),
      onPressed: () => _launchURL(url),
    );
  }

  // Método para abrir enlaces
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir $url';
    }
  }
}
