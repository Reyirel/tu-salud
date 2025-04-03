import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CuidadosGolpesCalorHipotermiaScreen extends StatefulWidget {
  @override
  _CuidadosGolpesCalorHipotermiaScreenState createState() => _CuidadosGolpesCalorHipotermiaScreenState();
}

class _CuidadosGolpesCalorHipotermiaScreenState extends State<CuidadosGolpesCalorHipotermiaScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el archivo de video local
    _controller = VideoPlayerController.asset('assets/video/cuidados_golpes_calor_hipotermia.mp4')
      ..initialize().then((_) {
        // Asegura de actualizar el estado cuando el video esté listo para reproducirse
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuidados ante Golpes de Calor e Hipotermia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cuidados ante Golpes de Calor e Hipotermia',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF468080),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Tanto los golpes de calor como la hipotermia son condiciones serias que requieren atención inmediata. Aquí algunos consejos para manejar estas situaciones:',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Para golpes de calor:\n1. Mueve a la persona a un lugar fresco y sombreado.\n2. Hidrata a la persona con agua si está consciente.\n3. Aplica toallas húmedas frías o un baño de agua fría para bajar la temperatura corporal.\n4. Busca atención médica inmediata si los síntomas son severos.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Para hipotermia:\n1. Mueve a la persona a un ambiente cálido y protegido del viento y la humedad.\n2. Elimina cualquier ropa mojada y cubre a la persona con mantas secas.\n3. Ofrece bebidas calientes (no alcohólicas) si la persona está consciente.\n4. No frotar ni masajear la piel de la persona.\n5. Busca atención médica inmediata.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

