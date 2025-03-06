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
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        toolbarHeight: 85,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
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
                "  Kasaychi",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 102, 0)),
              child: Text(
                "Comunidad Kasaychi",
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.black), // Icono de información
              title: const Text("Quiénes Somos"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Colors.black), // Icono de actividades
              title: const Text("Actividades"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivitiesScreen(siteId: 'kasaychi_actividades'))),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.black), // Icono de productos
              title: const Text("Productos"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductsScreen(siteId:'kasaychi_productos'))),
            ),
            ListTile(
              leading: const Icon(Icons.photo_album, color: Colors.black), // Icono de multimedia
              title: const Text("Multimedia"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultimediaSection())),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail, color: Colors.black), // Icono de contacto
              title: const Text("Contáctanos"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContactPage())),
            ),
            ListTile(
              leading: const Icon(Icons.map, color: Colors.black), // Icono de mapa
              title: const Text("Mapa"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultiMapScreen())),
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
              // Primera sección con imagen de fondo ocupando toda la pantalla
              Stack(
                children: [
                  Container(
                    height: screenHeight, // Ocupa toda la pantalla
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/fondoLejano.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Positioned(
                    bottom: 150,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bienvenido a",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const Text(
                          "Comunidad Kasaychi",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "La Comunidad Kasaychi es una comunidad indígena ubicada en la provincia de Guaranda, Ecuador. Fundada formalmente bajo el nombre Fundación Kasaychi Runakunapak Tantari 'Inti Churi' el 19 de junio de 1992.",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildSocialIcon(FontAwesomeIcons.twitter, "https://twitter.com/"),
                            const SizedBox(width: 15),
                            _buildSocialIcon(FontAwesomeIcons.instagram, "https://www.instagram.com/"),
                            const SizedBox(width: 15),
                            _buildSocialIcon(FontAwesomeIcons.facebook, "https://www.facebook.com/"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Segunda sección con efecto de transición suave
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Acerca de Comunidad Kasaychi",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Trayectoria",
                      style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "A 10 largo de los años, la comunidad ha desarrollado varias iniciativas para fomentar la educación y el bienestar social, incluyendo la creación de un molino de grano en 1981, la obtención de terrenos comunales para su sede social, y la implementación de proyectos de mejoramiento ganadero y procesamiento de derivados lácteos.",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    
                    // Sección de Cards
                    Column(
                      children: [
                        _buildInfoCard("assets/images/Img1.1.png", "Nuestros Paisajes",
                            "Kasaychi se encuentra en una zona andina con un clima frío, situada a una altitud entre 3000 y 3400 msnm. La comunidad está rodeada de majestuosos paisajes de montañas, valles verdes, y tierras agrícolas que reflejan la belleza del entorno natural."),
                        const SizedBox(height: 15),
                        _buildInfoCard("assets/images/Img1.2.png", "Nuestras Tradiciones",
                            "Las tradiciones de la Comunidad Kasaychi están profundamente arraigadas en su herencia kichwa. Las festividades y celebraciones tienen origen prehispánico, reflejando la cosmovisión y los valores culturales que han sido transmitidos de generación en generación."),
                        const SizedBox(height: 15),
                        _buildInfoCard("assets/images/Img1.3.png", "Nuestra Gente",
                            "La población de Kasaychi está compuesta por aproximadamente 753 personas distribuidas en seis comunidades: Casaichi Arenal, Grupo Comunitario Cacuango, Casaichi San Antonio, Casaichi Chinipamba, Casaichi Herapamba, y Casaichi Llama Corral. Se caracterizan por su participación activa de sus miembros en las actividades productivas y culturales."),
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
                      "Actividades",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const Text(
                      "Comunidad Kasaychi",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    const SizedBox(height: 15),
                    

                    Column(
                      children: [
                        _buildServiceCard(
                          FontAwesomeIcons.peopleGroup,
                          "Actividades Sociales",
                          "¿Estás interesado en conocer más a fondo nuestra comunidad? ¿Deseas conocer el estilo de vida y conectar con la Naturaleza? Tenemos varias actividades que harán que ames la naturaleza y nuestra comunidad.",
                          [
                            FontAwesomeIcons.tree,
                            FontAwesomeIcons.leaf,
                            FontAwesomeIcons.water
                          ]
                        ),
                        const SizedBox(height: 15),
                        _buildServiceCard(
                          FontAwesomeIcons.handHoldingDollar,
                          "Actividades Económicas",
                          "Comunidad Kasaychi ha generado emprendimientos a partir de lo que la naturaleza le brinda para mantenerse activa, y ahora queremos que todos los conozcan y consuman. ¿Te interesa saber que productos tenemos?",
                          [
                            FontAwesomeIcons.cow,
                            FontAwesomeIcons.bottleWater,
                            FontAwesomeIcons.cheese
                          ]
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
                    const Text(
                      "Nuestra Galería",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 102, 0)),
                    ),
                    const SizedBox(height: 15),
                    

                    Column(
                      children: [
                        _buildGallerySection(),
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

  Widget _buildServiceCard(IconData icon, String title, String description, List<IconData> icons) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Espaciado exterior
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

              // Row con los tres íconos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribución uniforme
                children: icons.map((icon) {
                  return FaIcon(
                    icon,
                    size: 28, // Tamaño ajustado
                    color: Color.fromARGB(255, 255, 102, 0), // Color secundario
                  );
                }).toList(),
              ),
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
