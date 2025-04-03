import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AtencionQuemadurasScreen extends StatefulWidget {
  @override
  _AtencionQuemadurasScreenState createState() => _AtencionQuemadurasScreenState();
}

class _AtencionQuemadurasScreenState extends State<AtencionQuemadurasScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el archivo de video local
    _controller = VideoPlayerController.asset('assets/video/atencion_quemaduras.mp4')
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
        title: Text('Atención a Quemaduras'),
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
                          'Atención a Quemaduras',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF468080),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Las quemaduras requieren cuidado inmediato para prevenir complicaciones y promover la curación. Aquí algunos pasos básicos para la atención inicial de quemaduras:',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1. Enfría la quemadura bajo agua corriente fría durante 10-15 minutos.\n2. No apliques hielo directamente sobre la quemadura.\n3. Cubre la quemadura con un vendaje estéril o un paño limpio.\n4. No rompas las ampollas que se formen.\n5. Aplica crema para quemaduras si tienes, pero evita remedios caseros como mantequilla o aceite.\n6. Si la quemadura es grave, busca atención médica inmediatamente.',
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
                    height: 200, // Proporciona una altura para mantener el layout
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
