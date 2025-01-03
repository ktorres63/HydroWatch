// lib/features/home/home_page.dart
import 'package:flutter/material.dart';
import 'dashboard/puntos_riego_listado.dart';
import 'waterLvlScreen.dart';
import 'settings.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Lista de páginas para el BottomNavigationBar
  final List<Widget> _pages = [
    NodeListScreen(),
    TankView(),
    SettingsPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Puntos Riego',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Tanque Agua',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuracion',
          ),
        ],
      ),
    );
  }
}