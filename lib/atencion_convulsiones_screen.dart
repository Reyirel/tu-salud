import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AtencionConvulsionesScreen extends StatefulWidget {
  @override
  _AtencionConvulsionesScreenState createState() => _AtencionConvulsionesScreenState();
}

class _AtencionConvulsionesScreenState extends State<AtencionConvulsionesScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el archivo de video local
    _controller = VideoPlayerController.asset('assets/video/atencion_convulsiones.mp4')
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
        title: Text('Atención a Convulsiones'),
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
                          'Atención a Convulsiones',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF468080),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'La atención adecuada durante una convulsión puede ayudar a prevenir lesiones. Sigue estos pasos cuando asistas a alguien con una convulsión:',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1. Mantén la calma y asegura el área retirando objetos peligrosos cercanos.\n2. Coloca algo suave debajo de la cabeza de la persona.\n3. No sujetes a la persona con fuerza ni intentes detener sus movimientos.\n4. No introduzcas nada en la boca de la persona.\n5. Controla el tiempo de duración de la convulsión.\n6. Una vez que la convulsión haya terminado, coloca a la persona de lado para facilitar la respiración.\n7. Habla con la persona con calma y ofrece tu ayuda.\n8. Si es la primera convulsión, dura más de 5 minutos, o la persona no recupera la conciencia, busca atención médica inmediata.',
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
