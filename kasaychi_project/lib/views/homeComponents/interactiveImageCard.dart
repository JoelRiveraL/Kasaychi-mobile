import 'package:flutter/material.dart';

class InteractiveImageCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;

  const InteractiveImageCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _InteractiveImageCardState createState() => _InteractiveImageCardState();
}

class _InteractiveImageCardState extends State<InteractiveImageCard> {
  bool _isTapped = false;

  void _toggleOverlay() {
    setState(() {
      _isTapped = !_isTapped;
    });

    // Ocultar el efecto después de 1 segundo
    if (_isTapped) {
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          setState(() {
            _isTapped = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOverlay,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Imagen de fondo
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.imagePath,
                width: 300, // Más grande
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            // Efecto de desenfoque con degradado naranja
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isTapped ? 1.0 : 0.0,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(255, 157, 87, 37),
                      Color.fromARGB(228, 153, 81, 30),
                      Color.fromARGB(202, 132, 66, 20),
                      Color.fromARGB(179, 137, 75, 30),
                      Color.fromARGB(161, 121, 79, 48),
                      Color.fromARGB(130, 121, 79, 48),

                      
                      Colors.transparent,
                    ],
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
