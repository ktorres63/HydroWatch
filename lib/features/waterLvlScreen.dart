import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydro_watch/features/common/error_display.dart';
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
        elevation: 0, // Eliminar color de fondo del AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centrado horizontal
            children: [
              // Si está cargando, mostrar indicador de carga
              if (_isLoading)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      strokeWidth: 6.0,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Cargando datos...',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                  ],
                ),

              // Si ocurrió un error
              if (_isError)
                ErrorDisplay(
                  title: "Algo salió mal",
                  message: _errorMessage,
                  onRetry: _retryFetchingData,
                ),

              // Si se recibieron los datos correctamente
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

                    final waterVolume = snapshot.data?.volume ?? 0.0;

                    return Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      color: Colors.blue[50],
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.water_drop,
                              size: 100,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Nivel de Agua',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${waterVolume.toStringAsFixed(2)} MiniLitros',
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
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
