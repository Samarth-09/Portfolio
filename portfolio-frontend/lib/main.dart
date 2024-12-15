import 'package:flutter/material.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/screens/ContactMe.dart';
import 'package:portfolio/screens/Experience.dart';
import 'package:portfolio/screens/Projects.dart';
import 'package:portfolio/screens/Skills.dart';
import 'package:portfolio/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const home(),
      routes: {
        routes.home: (context) => const home(),
        routes.projects: (context) => const Projects(),
        routes.contactMe: (context) => const ContactMe(),
        routes.skills: (context) => const Skills(),
        routes.Experience: (context) => const Experience()
      },
    );
  }
}
