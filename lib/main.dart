import 'package:flutter/material.dart';
import 'qrcode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Generator',
      theme: ThemeData(
        primaryColor: const Color(0xFF155E95),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF155E95),
            foregroundColor: Colors.white, // Texte blanc
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xFF155E95),
          ),
        ),
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _profNameController = TextEditingController();
  final TextEditingController _examNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QR Code Form",
          style: TextStyle(color: Colors.white), // Texte en blanc
        ),
        backgroundColor: const Color(0xFF155E95), // Couleur de l'AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Icônes en blanc
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // **Ajout de l'image en haut du formulaire**
                Image.asset(
                  'assest/header_image.jfif', // Chemin de l'image
                  height: 300, // Hauteur de l'image
                  fit: BoxFit.contain, // Ajustement de l'image
                ),
                const SizedBox(height: 20), // Espace entre l'image et les champs
                TextField(
                  controller: _profNameController,
                  decoration: const InputDecoration(
                    labelText: "Nom du Professeur",
                    prefixIcon: Icon(Icons.person, color: Color(0xFF155E95)),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _examNameController,
                  decoration: const InputDecoration(
                    labelText: "Nom de l'Examen",
                    prefixIcon: Icon(Icons.book, color: Color(0xFF155E95)),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_profNameController.text.isNotEmpty &&
                        _examNameController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRCodePage(
                            profName: _profNameController.text,
                            examName: _examNameController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Générer QR Code"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
