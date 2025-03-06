import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasaychi_project/views/homeComponents/interactiveImageCard.dart';

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

              Container(
                color: Color.fromARGB(255, 51, 51, 51),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Nuestra Historia",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const Text(
                      "Orígenes y Tradiciones",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Nuestra historia se remonta a tiempos preincaicos, cuando nuestras tierras fueron habitadas por las tribus Panzaleas y Yacotos, guerreros que resistieron tanto a los incas como a los españoles. Hoy, conservamos tradiciones como:",
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255), ),
                    ),
                    const SizedBox(height: 25),

                    Column(
                      children: [
                        InteractiveImageCard(
                          imagePath: "assets/images/vestimenta.jpg",
                          title: "Vestimenta Tradicional",
                          description: "Se ha mantenido el uso de prendas como anacos tejidos a mano, blusas bordadas y collares de mullos.",
                        ),
                        const SizedBox(height: 15),
                        InteractiveImageCard(
                          imagePath: "assets/images/festividades.png",
                          title: "Festividades",
                          description: "El Inti Raymi (Fiesta del Sol), celebraciones a la Pachamama (Madre Tierra) y rituales de agradecimiento por las cosechas.",
                        ),
                        const SizedBox(height: 15),
                        InteractiveImageCard(
                          imagePath: "assets/images/sisOrganizativo.png",
                          title: "Sistema Organizativo",
                          description: "La organización de su gente se basa en Asambleas comunitarias y mingas para construir viviendas o cuidar cultivos.",
                        ),
                        const SizedBox(height: 15),

                        

                      ],
                    ),
                  ],
                ),
              ),

              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Hitos Relevantes",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    const SizedBox(height: 15),
                    

                    Column(
                      children: [
                        _buildServiceCard(
                          FontAwesomeIcons.award,
                          "Reconocimiento como Organización 2010",
                          "Reconocimiento como comunidad organizada bajo el nombre Casaichis Runacunapac Tantari Inti Churi - Hombres Hijos del Sol"
                        ),
                        const SizedBox(height: 15),
                        _buildServiceCard(
                          FontAwesomeIcons.cheese,
                          "Creación de la Quesería Comunitaria",
                          "Fundación de Inti Churi en 1990, la primera quesería gestionada por la comunidad. Usa leche de vacas criadas en páramo y técnicas ancestrales."
                        ),
                        const SizedBox(height: 15),
                        _buildServiceCard(
                          FontAwesomeIcons.feather,
                          "Resistencia Prehispánica (Siglos XV-XVI)",
                          "Las tribus Panzaleas y Yacotos, antecesoras de la comunidad, resistieron activamente la invasión inca y española, defendiendo su territorio y autonomía"
                        ),
                        const SizedBox(height: 15),

                        _buildServiceCard(
                          FontAwesomeIcons.school,
                          "Unificación Escolar (Década de 1990)",
                          "Fusión de cuatro escuelas en una escuela pluridocente comunitaria, priorizando la educación bilingüe (kichwa-español) y la participación activa de padres"
                        ),
                        const SizedBox(height: 15),
                        _buildServiceCard(
                          FontAwesomeIcons.userGraduate,
                          "Tesis Universitaria y Plan de Revitalización",
                          "Investigación de la Universidad Estatal de Bolívar que impulsó el Plan de Revitalización Cultural, enfocado en fortalecer la identidad y fomentar el turismo comunitario"
                        ),
                        const SizedBox(height: 15),
                        _buildServiceCard(
                          FontAwesomeIcons.seedling,
                          "Proyectos Recientes (2020-actualidad)",
                          "Se han planteado proyectos como la Reforestación de Páramos, Talleres culturales y Alianzas Académicas, de manera que se pueda profundizar la identidad y crear interés"
                        ),
                        const SizedBox(height: 30),
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 102, 0),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }






}
