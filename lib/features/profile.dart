// import 'package:flutter/material.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: Center(child: Text('User Profile')),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dart:convert'; // Para manejar JSON
import 'package:http/http.dart' as http; // Para las solicitudes HTTP

class TankView extends StatefulWidget {
  @override
  _TankViewState createState() => _TankViewState();
}

class _TankViewState extends State<TankView> {
  int? waterLevelLiters; // Nivel de agua
  bool isLoading = true; // Indicador de carga

  // Función para obtener datos del API
  Future<void> fetchWaterLevel() async {
    const url = 'https://apimocha.com/hydrowatch/api/tank/water-level';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          waterLevelLiters = data[0]['water_level_liters'];
          isLoading = false;
        });
      } else {
        throw Exception("Error al cargar los datos");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar datos: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWaterLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agua'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nivel del Agua',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_drink,
                  size: 80,
                  color: Colors.grey.shade700,
                ),
                SizedBox(height: 10),
                Text(
                  'Agua restante',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${waterLevelLiters ?? 0} Litros',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.grass),
      //       label: 'Plantas',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.local_drink),
      //       label: 'Tanque',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Perfil',
      //     ),
      //   ],
      //   currentIndex: 1, // Índice actual (Tanque)
      //   onTap: (index) {
      //     // Manejar la navegación entre vistas
      //   },
      // ),
    );
  }
}
