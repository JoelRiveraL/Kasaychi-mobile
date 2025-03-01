import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MultimediaSection extends StatefulWidget {
  @override
  _MultimediaSectionState createState() => _MultimediaSectionState();
}

class _MultimediaSectionState extends State<MultimediaSection> {
  String videoUrl =
      'https://www.youtube.com/embed/Ava0duwBsZo'; // Video inicial

  void changeMainVideo(String url) {
    setState(() {
      videoUrl = url; // Cambiar URL al de la miniatura seleccionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Our Multimedia')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título de la sección
              const Text(
                'Our Multimedia',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Video Principal
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/OIP.jpeg'),
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
                        'Bôa - Duvet (Lyrics)', 'assets/images/OIP.jpeg'),
                    _buildThumbnail(
                        'https://www.youtube.com/embed/3ssL8vx7Xhg?list=PLgS0SSa1anukbM0QbNBw5IMsFiBYZz7CR',
                        'Happy and Fun Pop Music',
                        'assets/images/OIP.jpeg'),
                    _buildThumbnail(
                        'https://www.youtube.com/embed/nfmdbKeSh7I',
                        'Juan Luis Guerra - Las avispas',
                        'assets/images/OIP.jpeg'),
                    _buildThumbnail(
                        'https://www.youtube.com/embed/nfmdbKeSh7I',
                        'Juan Luis Guerra - Las avispas',
                        'assets/images/OIP.jpeg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Contenido secundario de multimedia
              const Text(
                'Additional Multimedia Content',
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
      physics: NeverScrollableScrollPhysics(),
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
          image: AssetImage('assets/images/OIP.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Título del Video',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Video',
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
