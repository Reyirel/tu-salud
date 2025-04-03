import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TratamientoIntoxicacionesScreen extends StatefulWidget {
  @override
  _TratamientoIntoxicacionesScreenState createState() => _TratamientoIntoxicacionesScreenState();
}

class _TratamientoIntoxicacionesScreenState extends State<TratamientoIntoxicacionesScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el archivo de video local
    _controller = VideoPlayerController.asset('assets/video/tratamiento_intoxicaciones.mp4')
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
        title: Text('Tratamiento de Intoxicaciones'),
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
                          'Tratamiento de Intoxicaciones',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF468080),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'El tratamiento adecuado para las intoxicaciones depende de la sustancia implicada. Es crucial actuar con rapidez y seguir estos pasos generales mientras buscas ayuda médica:',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1. Evalúa la situación: asegúrate de que tú y la persona intoxicada estén en un lugar seguro.\n2. Identifica la sustancia tóxica si es posible.\n3. Llama a los servicios de emergencia o al centro de control de intoxicaciones de tu país para recibir instrucciones específicas.\n4. No induzcas el vómito a menos que un profesional de la salud te lo indique.\n5. Si la intoxicación es por inhalación, lleva a la persona a un área con aire fresco.\n6. En caso de contacto con la piel, lava el área con agua durante 15-20 minutos.\n7. Conserva la sustancia tóxica o cualquier muestra para que los profesionales de la salud puedan analizarla.',
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
