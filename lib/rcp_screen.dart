import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RCPScreen(),
    );
  }
}

class RCPScreen extends StatefulWidget {
  @override
  _RCPScreenState createState() => _RCPScreenState();
}

class _RCPScreenState extends State<RCPScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el archivo de video local
    _controller = VideoPlayerController.asset('assets/video/rcp_video.mp4')
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
        title: Text('RCP (Reanimación Cardiopulmonar)'),
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
                          'RCP (Reanimación Cardiopulmonar)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF468080),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'La RCP es una técnica de emergencia vital que combina respiraciones de rescate y compresiones torácicas para ayudar a salvar la vida de alguien que ha sufrido un paro cardíaco. Sigue estos pasos para realizar la RCP correctamente:',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1. Asegúrate de que el entorno sea seguro.\n2. Verifica si la persona está consciente; si no responde, llama a emergencias.\n3. Coloca tus manos una sobre la otra en el centro del pecho de la persona.\n4. Presiona hacia abajo con fuerza y rapidez, aproximadamente 2 compresiones por segundo.\n5. Si estás capacitado, realiza respiraciones de rescate después de 30 compresiones.\n6. Continúa hasta que llegue ayuda médica o la persona recupere la conciencia.',
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

