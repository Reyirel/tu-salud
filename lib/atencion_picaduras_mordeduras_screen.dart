import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AtencionPicadurasMordedurasScreen extends StatefulWidget {
  @override
  _AtencionPicadurasMordedurasScreenState createState() => _AtencionPicadurasMordedurasScreenState();
}

class _AtencionPicadurasMordedurasScreenState extends State<AtencionPicadurasMordedurasScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el archivo de video local
    _controller = VideoPlayerController.asset('assets/video/atencion_picaduras_mordeduras.mp4')
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
        title: Text('Atención a Picaduras y Mordeduras'),
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
                          'Atención a Picaduras y Mordeduras',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF468080),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Las picaduras y mordeduras de animales e insectos pueden variar en severidad. Aquí algunos consejos generales para manejar estas situaciones:',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1. Mantén la calma y aleja al afectado del animal o insecto para prevenir más picaduras o mordeduras.\n2. Limpia la herida con agua y jabón para reducir el riesgo de infección.\n3. Aplica una compresa fría para aliviar el dolor y la hinchazón.\n4. Mantén la zona afectada elevada si es posible.\n5. Observa si hay signos de reacción alérgica grave, como dificultad para respirar, hinchazón de la cara o el cuello, o mareos.\n6. En caso de reacciones alérgicas graves o si la mordedura fue de un animal salvaje o desconocido, busca atención médica inmediata.',
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
