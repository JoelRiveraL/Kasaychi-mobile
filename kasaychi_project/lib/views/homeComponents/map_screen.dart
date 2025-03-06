import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MultiMapScreen extends StatelessWidget {
  const MultiMapScreen({super.key});

  Future<void> _launchDirections() async {
    final Uri url = Uri.parse(
        "https://www.google.com/maps/dir/?api=1&destination=-1.608100,-78.881910&travelmode=driving");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final LatLng comunidad = LatLng(-1.608100, -78.881910);
    final LatLng intiChuri =
        LatLng(-1.5882928702945973, -78.91783887055217); // Unidad Educativa
    final LatLng tinku =
        LatLng(-1.5981018327713874, -78.91208446007171); // Centro Ecoturistico
    final LatLng casaiche =
        LatLng(-1.5817591813389813, -78.91531528284325); // Campo Casaiche

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapas"),
        backgroundColor: Color.fromARGB(255, 255, 102, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "¿Cómo llegar a la comunidad?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 255, 102, 0), width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: comunidad,
                        initialZoom: 14.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: comunidad,
                              width: 80,
                              height: 80,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _launchDirections,
                    child: const Text("Cómo llegar"),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lugares turísticos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Mapa 1: Unidad Educativa Intercultural Bilingüe Inti Churi
                  Text(
                    "Unidad Educativa Intercultural Bilingüe Inti Churi",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: intiChuri,
                        initialZoom: 16.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: intiChuri,
                              width: 50,
                              height: 50,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Centro Ecoturistico TINKU",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: tinku,
                        initialZoom: 16.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: tinku,
                              width: 50,
                              height: 50,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Campo Casaiche San Antonio",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: casaiche,
                        initialZoom: 16.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: casaiche,
                              width: 50,
                              height: 50,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
