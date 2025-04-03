import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DEAScreen extends StatefulWidget {
  @override
  _DEAScreenState createState() => _DEAScreenState();
}

class _DEAScreenState extends State<DEAScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el archivo de video local
    _controller = VideoPlayerController.asset('assets/video/dea_video.mp4')
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
        title: Text('DEA (Desfibrilador Externo Automático)'),
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
                          'Uso del DEA (Desfibrilador Externo Automático)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF468080),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Un DEA es un dispositivo utilizado para ayudar a las personas que sufren de paro cardíaco repentino. Es capaz de analizar el ritmo cardíaco y, si es necesario, administrar un choque eléctrico para intentar restablecer un ritmo cardíaco normal.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Pasos para usar un DEA:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1. Llama a los servicios de emergencia inmediatamente.\n2. Enciende el DEA y sigue las instrucciones verbales.\n3. Asegúrate de que el área alrededor del pecho de la persona esté seca y afeita cualquier pelo excesivo si es posible.\n4. Aplica las almohadillas del DEA como se indica en el dispositivo.\n5. Asegúrate de que nadie esté tocando a la persona y luego permite que el DEA analice el ritmo cardíaco.\n6. Si el DEA indica que se debe administrar un choque, asegúrate de que nadie esté en contacto con la persona y sigue las instrucciones para administrar el choque.',
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


