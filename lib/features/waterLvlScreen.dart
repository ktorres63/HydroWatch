import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydro_watch/features/common/error_display.dart';
import 'package:hydro_watch/features/dashboard/WaterLevelCard.dart';
import 'package:hydro_watch/service/api_service.dart';

class TankView extends StatefulWidget {
  @override
  _TankViewState createState() => _TankViewState();
}

class _TankViewState extends State<TankView> {
  final ApiService _apiService = ApiService();
  late StreamSubscription<WaterVolume> _waterVolumeSubscription;
  bool _isLoading = true;
  bool _isError = false;
  String _errorMessage = '';
  final int _timeoutDuration = 10; // Limitar el tiempo de carga a 10 segundos.
  final double _maxVolume = 300.0; // Define el nivel máximo del tanque.

  // Función para reiniciar la carga de datos
  void _retryFetchingData() {
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = '';
    });
    _fetchWaterVolume();
  }

  void _fetchWaterVolume() {
    _waterVolumeSubscription = _apiService.getWaterVolumeStream().listen(
          (waterVolume) {
        setState(() {
          _isLoading = false;
          _isError = false;
        });
      },
      onError: (error) {
        setState(() {
          _isLoading = false;
          _isError = true;
          _errorMessage = error.toString();
        });
      },
    );

    // Tiempo de espera para los datos (timeout)
    Future.delayed(Duration(seconds: _timeoutDuration), () {
      if (_isLoading) {
        setState(() {
          _isLoading = false;
          _isError = true;
          _errorMessage =
          'El tiempo de espera se ha agotado. Intenta nuevamente.';
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchWaterVolume();
  }

  @override
  void dispose() {
    _waterVolumeSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nivel de Agua'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_isLoading)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(strokeWidth: 6.0),
                    const SizedBox(height: 20),
                    Text(
                      'Cargando datos...',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                  ],
                ),
              if (_isError)
                ErrorDisplay(
                  title: "Algo salió mal",
                  message: _errorMessage,
                  onRetry: _retryFetchingData,
                ),
              if (!_isLoading && !_isError)
                StreamBuilder<WaterVolume>(
                  stream: _apiService.getWaterVolumeStream(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.warning_amber_outlined,
                              size: 80,
                              color: Colors.orange,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'No se encontraron datos de nivel de agua.',
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(fontSize: 18, color: Colors.orange),
                            ),
                          ],
                        ),
                      );
                    }

                    final waterVolume = snapshot.data!;
                    return WaterLevelCard(
                      waterVolume: waterVolume,
                      maxVolume: _maxVolume,
                      thresholds: [0.3, 0.6, 0.9], // Niveles de corte: 30%, 60%, 90%
                      colors: [Colors.red, Colors.orange, Colors.blue, Colors.green], // Colores asociados

                    );

                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
