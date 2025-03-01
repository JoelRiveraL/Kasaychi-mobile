import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acerca de Kasaychi")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Título "Acerca de Kasaychi"
              const Text(
                "Acerca de Comunidad Kasaychi",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Subtítulo "Trayectoria"
              const Text(
                "Trayectoria",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),

              // Descripción de la trayectoria
              const Text(
                "A lo largo de los años, la comunidad ha desarrollado varias iniciativas para fomentar la educación y el bienestar social, incluyendo la creación de un molino de grano en 1981, la obtención de terrenos comunales para su sede social, y la implementación de proyectos de mejoramiento ganadero y procesamiento de derivados lácteos. En 2008, lograron el acuerdo para operar un Bachillerato Técnico Agropecuario, un hito importante en su desarrollo educativo.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Servicios (Paisajes, Tradiciones, Gente)
              _buildServiceSection(
                  "Nuestros Paisajes",
                  "Kasaychi se encuentra en una zona andina con un clima frío, situada a una altitud de entre 3000 y 3400 metros sobre el nivel del mar. La comunidad está rodeada de majestuosos paisajes de montañas, valles verdes, y tierras agrícolas que reflejan la belleza y la diversidad del entorno natural en el que viven.",
                  "assets/images/Img1.1.png"),
              _buildServiceSection(
                  "Nuestras Tradiciones",
                  "Las tradiciones de la Comunidad Kasaychi están profundamente arraigadas en su herencia kichwa. Las festividades y celebraciones tienen un origen prehispánico y son una parte vital de la vida comunitaria, reflejando la cosmovisión y los valores culturales que han sido transmitidos de generación en generación.",
                  "assets/images/Img1.2.png"),
              _buildServiceSection(
                  "Nuestra Gente",
                  "La población de Kasaychi está compuesta por aproximadamente 753 personas distribuidas en seis comunidades: Casaichi Arenal, Grupo Comunitario Cacuango, Casaichi San Antonio, Casaichi Chinipamba, Casaichi Herapamba, y Casaichi Llama Corral. La comunidad se caracteriza por su cohesión social y la participación activa de sus miembros en las actividades productivas y culturales.",
                  "assets/images/Img1.3.png"),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para las secciones de servicios (Paisajes, Tradiciones, Gente)
  Widget _buildServiceSection(
      String title, String description, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen
          Center(
            child: Image.asset(imagePath, width: 250),
          ),
          const SizedBox(height: 10),

          // Título de la sección
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),

          // Descripción
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
