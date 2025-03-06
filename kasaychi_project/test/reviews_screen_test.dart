import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kasaychi_project/services/auth_service.dart';
import 'package:kasaychi_project/views/homeComponents/reviews_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reviews_screen_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  FirebaseFirestore,
  CollectionReference,
  Query,
  QuerySnapshot,
  DocumentSnapshot,
  QueryDocumentSnapshot,
  DocumentReference,
  AuthService,
  User,
])
void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockQuery<Map<String, dynamic>> mockQuery;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late MockAuthService mockAuthService;
  late MockUser mockUser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference<Map<String, dynamic>>();
    mockQuery = MockQuery<Map<String, dynamic>>();
    mockQuerySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
    mockAuthService = MockAuthService();
    mockUser = MockUser();

    when(mockFirestore.collection('reviews')).thenReturn(mockCollectionReference);
    when(mockCollectionReference.where('siteId', isEqualTo: 'test_site'))
        .thenReturn(mockQuery);
    when(mockQuery.orderBy('timestamp', descending: true)).thenReturn(mockQuery);
    when(mockQuery.snapshots()).thenAnswer((_) => Stream.value(mockQuerySnapshot));
    when(mockAuthService.currentUser).thenReturn(null);
    when(mockAuthService.signOut()).thenAnswer((_) async {});
  });

  testWidgets('Muestra "Aún no hay reseñas" cuando no hay datos', (WidgetTester tester) async {
    when(mockQuerySnapshot.docs).thenReturn([]);

    await tester.pumpWidget(
      MaterialApp(
        home: ReviewsScreen(
          siteId: 'test_site',
          authService: mockAuthService,
          firestore: mockFirestore,
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Aún no hay reseñas'), findsOneWidget);
  });

  testWidgets('Envía reseña cuando está autenticado', (WidgetTester tester) async {
    when(mockAuthService.currentUser).thenReturn(mockUser);
    when(mockUser.uid).thenReturn('test_uid');
    when(mockUser.displayName).thenReturn('Test User');
    when(mockCollectionReference.add(argThat(isA<Map<String, dynamic>>())))
        .thenAnswer((_) async => MockDocumentReference<Map<String, dynamic>>());
    when(mockQuerySnapshot.docs).thenReturn([]);

    await tester.pumpWidget(
      MaterialApp(
        home: ReviewsScreen(
          siteId: 'test_site',
          authService: mockAuthService,
          firestore: mockFirestore,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '¡Buen producto!');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pumpAndSettle();

    verify(mockCollectionReference.add(argThat(predicate((map) {
      // Verifica que el mapa contenga los valores esperados
      return map is Map<String, dynamic> &&
          map['siteId'] == 'test_site' &&
          map['userId'] == 'test_uid' &&
          map['userName'] == 'Test User' &&
          map['comment'] == '¡Buen producto!' &&
          map['rating'] == 5 &&
          map['timestamp'] != null; // Solo verifica que timestamp no sea null
    })))).called(1);

    expect(find.text('Reseña enviada con éxito'), findsOneWidget);
  });
}