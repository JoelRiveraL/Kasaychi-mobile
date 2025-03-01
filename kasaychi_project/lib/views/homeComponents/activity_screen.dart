import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actividades Kasaychi")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            const Text(
              "Actividades Comunidad Kasaychi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Actividades Sociales
            _buildActivitySection(
              "Actividades Sociales",
              "¿Estás interesado en conocer más a fondo nuestra comunidad? ¿Deseas conocer el estilo de vida y conectar con la Naturaleza? Tenemos varias actividades que harán que ames la naturaleza y nuestra comunidad.",
              [
                Icons.nature,
                Icons.sledding,
                Icons.water_drop,
              ],
            ),

            const SizedBox(height: 20),

            // Actividades Económicas
            _buildActivitySection(
              "Actividades Económicas",
              "Comunidad Kasaychi ha generado emprendimientos a partir de lo que la naturaleza le brinda para mantenerse activa, y ahora queremos que todos los conozcan y consuman. ¿Te interesa saber que productos tenemos?",
              [
                Icons.agriculture,
                Icons.local_drink,
                Icons.fastfood,
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para las secciones de actividades
  Widget _buildActivitySection(
      String title, String description, List<IconData> icons) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la actividad
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),

          // Descripción de la actividad
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),

          // Íconos relacionados con la actividad
          Row(
            children: icons
                .map((icon) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(icon, size: 30),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
