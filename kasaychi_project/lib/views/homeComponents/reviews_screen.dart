import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kasaychi_project/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReviewsScreen extends StatefulWidget {
  final String siteId;
    final AuthService? authService; // Hacerlo opcional para pruebas

  const ReviewsScreen({super.key, required this.siteId, this.authService});

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final _commentController = TextEditingController();
  late final AuthService _authService;
  int _rating = 5;

  @override
  void initState() {
    super.initState();
    _authService = widget.authService ?? AuthService(); // Usa el proporcionado o crea uno
  }
  
  Future<void> _submitReview() async {
    if (_authService.currentUser != null) {
      await FirebaseFirestore.instance.collection('reviews').add({
        'siteId': widget.siteId,
        'userId': _authService.currentUser!.uid,
        'userName': _authService.currentUser!.displayName ?? 'Anónimo',
        'comment': _commentController.text,
        'rating': _rating, //
        'timestamp': FieldValue.serverTimestamp(),
      });
      _commentController.clear();
      setState(() {
        _rating = 5; // 
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Reseña enviada con éxito'),
          backgroundColor: Color.fromARGB(255, 255, 102, 0),
        ),
      );
    } else {
      User? user = await _authService.signInWithGoogle();
      if (user != null) {
        setState(() {}); 
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 102, 0),
        title: const Text(
          'Reseñas',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          if (_authService.currentUser != null)
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () async {
                await _authService.signOut();
                setState(() {});
              },
            ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 242, 242, 242), // Fondo gris claro
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('reviews')
                    .where('siteId', isEqualTo: widget.siteId)
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 255, 102, 0),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        'Aún no hay reseñas',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                  }

                  var reviews = snapshot.data!.docs;
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      var review = reviews[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(
                                  review['rating'],
                                  (i) => const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 255, 102, 0),
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                review['comment'],
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '- ${review['userName']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (_authService.currentUser != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: const Color.fromARGB(255, 255, 102, 0),
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              _rating = index + 1; // Actualiza la calificación
                            });
                          },
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                  ],
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: _authService.currentUser != null
                                ? 'Escribe tu reseña'
                                : 'Inicia sesión para escribir',
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 102, 0),
                            ),
                            enabled: _authService.currentUser != null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 102, 0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 102, 0),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (_authService.currentUser != null)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 102, 0),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: _submitReview,
                          child: const Icon(Icons.send),
                        )
                      else
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 102, 0),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: _submitReview,
                          child: const Text('Iniciar sesión'),
                        ),
                    ],
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