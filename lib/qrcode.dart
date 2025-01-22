import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  final String profName;
  final String examName;

  const QRCodePage({super.key, required this.profName, required this.examName});

  @override
  Widget build(BuildContext context) {
    String qrData = "Professeur: $profName\nExamen: $examName";

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
        backgroundColor: const Color(0xFF155E95),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Le code de l'examen",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF155E95),
                ),
              ),
              const SizedBox(height: 20),
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 250.0, // Taille du QR Code
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Logique pour sauvegarder le QR Code
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("QR Code sauvegardé avec succès !"),
                    ),
                  );
                },
                child: const Text("Sauvegarder QR Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
