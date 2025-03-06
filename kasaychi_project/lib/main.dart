import 'package:flutter/material.dart';
import 'package:kasaychi_project/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kasaychi_project/views/homeComponents/reviews_screen.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.flutter run
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //quitar cinta de debug
        
      ),
      home: const HomeScreen(),
      // home: ReviewsScreen(siteId: 'test'),
    );
  }
}
