import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kasaychi_project/views/homeComponents/reviews_screen.dart';
import 'package:kasaychi_project/widgets/reviews_widget.dart';

class ActivitiesScreen extends StatelessWidget {
  final String siteId;

  const ActivitiesScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
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
            const Expanded(
              child: Text(
                "  Actividades",
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Actividades Sociales",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Festividades y Rituales",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 102, 0),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        _buildServiceCard(
                          FontAwesomeIcons.sun,
                          "Inti Raymi (Junio)",
                          "Celebración del año nuevo andino con danzas, música autóctona y ofrendas al sol.",
                        ),
                        _buildServiceCard(
                          FontAwesomeIcons.personDress,
                          "Fiesta de la Mama Naty (Agosto)",
                          "Homenaje a la Virgen de las Nieves, fusionando tradiciones católicas e indígenas.",
                        ),
                        _buildServiceCard(
                          FontAwesomeIcons.handshakeAngle,
                          "Mingas comunitarias",
                          "Jornadas de trabajo colectivo para siembras, cosechas o construcción de infraestructura.",
                        ),
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
                    _buildFestivitiesTable(),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: ReviewsWidget(siteId: siteId), // Usa el widget reutilizable
              ),
            ],
          ),
        ),
      ),
    );
  }
   

  Widget _buildServiceCard(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                size: 50,
                color: const Color.fromARGB(255, 255, 102, 0),
              ),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFestivitiesTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(text: "Calendario "),
              TextSpan(
                text: "Anual",
                style: TextStyle(color: Color.fromARGB(255, 255, 102, 0)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        Table(
          border: TableBorder.all(color: Colors.grey, width: 1),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 102, 0)),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Mes",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Evento",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Descripción",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            _buildTableRow("Junio", "Inti Raymi", "Danzas, rituales y gastronomía andina"),
            _buildTableRow("Agosto", "Fiesta de la Mama Naty", "Procesiones, música y juegos tradicionales"),
            _buildTableRow("Noviembre", "Ceremonia de la Cosecha", "Agradecimiento a la Pachamama"),
          ],
        ),
        const SizedBox(height: 35),
      ],
    );
  }

  TableRow _buildTableRow(String month, String event, String description) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(month, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            event,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description, textAlign: TextAlign.left),
        ),
      ],
    );
  }
}