import 'package:bloco_notas/screen/bloco_notas.dart';
import 'package:bloco_notas/service/notification_service.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Projeto - Bloco de notas"),
        ),
        body: BlocoNotas(),
      ),
    );
  }
}
