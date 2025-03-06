import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kasaychi_project/views/homeComponents/reviews_screen.dart';

class ReviewsWidget extends StatelessWidget {
  final String siteId;

  const ReviewsWidget({super.key, required this.siteId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Reseñas",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('reviews')
              .where('siteId', isEqualTo: siteId)
              .limit(2)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error al cargar reseñas'));
            }

            Widget reviewsWidget = snapshot.hasData && snapshot.data!.docs.isNotEmpty
                ? Column(
                    children: snapshot.data!.docs
                        .map(
                          (doc) => Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(
                                doc['comment'],
                                style: const TextStyle(fontSize: 16),
                              ),
                              subtitle: Text(
                                '${doc['rating']} ★ - ${doc['userName']}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : const Text(
                    'Aún no hay reseñas para este lugar.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  );

            return Column(
              children: [
                reviewsWidget,
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 102, 0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewsScreen(siteId: siteId),
                            ),
                          );
                        },
                        child: const Text('Ver todas las reseñas/ Enviar Mensaje'),
                      ),
                    
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}