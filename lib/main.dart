import 'package:flutter/material.dart';
import 'package:map_flutter/map_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAPA ADSO',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:const MapScreen()
    );
  }
}
