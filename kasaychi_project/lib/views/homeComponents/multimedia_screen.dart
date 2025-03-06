import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MultimediaSection extends StatefulWidget {
  const MultimediaSection({super.key});

  @override
  _MultimediaSectionState createState() => _MultimediaSectionState();
}

class _MultimediaSectionState extends State<MultimediaSection> {
  String videoUrl =
      'https://www.youtube.com/embed/Ava0duwBsZo'; // Video inicial

  void changeMainVideo(String url) {
    setState(() {
      videoUrl = url;
    });
  }

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
                "  Nuestra Multimedia",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título de la sección
              const Text(
                'Nuestra Multimedia',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Video Principal
              Container(
                
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/fondoLejanoCalleAlto.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Miniaturas de video
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildThumbnail('https://www.youtube.com/embed/Ava0duwBsZo',
                        'Entrada', 'assets/images/CalleEntrada.jpg'),
                    _buildThumbnail(
                        'https://www.youtube.com/embed/3ssL8vx7Xhg?list=PLgS0SSa1anukbM0QbNBw5IMsFiBYZz7CR',
                        'Viviendas',
                        'assets/images/bg.jpg'),
                    _buildThumbnail(
                        'https://www.youtube.com/embed/nfmdbKeSh7I',
                        'Escuela',
                        'assets/images/fondoEscuela.jpg'),
                    _buildThumbnail(
                        'https://www.youtube.com/embed/nfmdbKeSh7I',
                        'Juan Luis Guerra - Las avispas',
                        'assets/images/childsEscuela.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Contenido secundario de multimedia
              const Text(
                'Fotos Adicionales',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildMediaGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail(String url, String title, String imagePath) {
    return GestureDetector(
      onTap: () => changeMainVideo(url),
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        width: 120,
        height: 120,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(4.0),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMediaGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 6, // Puedes agregar más elementos
      itemBuilder: (context, index) {
        return _buildMediaItem();
      },
    );
  }

  Widget _buildMediaItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage('assets/images/childsEscuela.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  '.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
