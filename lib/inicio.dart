import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FirstAidHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> firstAids = [
    {
      'title': 'RCP (Reanimación Cardiopulmonar)',
      'description': 'Técnica de emergencia para salvar vidas.',
      'image': 'assets/images/rcp.png',
      'route': '/rcp',
    },
    {
      'title': 'Uso de un DEA (Desfibrilador Externo Automático)',
      'description': 'Procedimiento para reanimar el corazón.',
      'image': 'assets/images/dea.png',
      'route': '/dea',
    },
    {
      'title': 'Control de Hemorragias',
      'description': 'Métodos para detener el sangrado.',
      'image': 'assets/images/hemorragias.png',
      'route': '/hemorragias',
    },
    {
      'title': 'Atención a Quemaduras',
      'description': 'Cuidados iniciales para quemaduras.',
      'image': 'assets/images/quemaduras.png',
      'route': '/quemaduras',
    },
    {
      'title': 'Manejo de Fracturas y Lesiones Musculares',
      'description': 'Cómo inmovilizar y apoyar lesiones.',
      'image': 'assets/images/fracturas.png',
      'route': '/fracturas',
    },
    {
      'title': 'Atención a Convulsiones',
      'description': 'Qué hacer ante una convulsión.',
      'image': 'assets/images/convulsiones.png',
      'route': '/convulsiones',
    },
    {
      'title': 'Maniobra de Heimlich',
      'description': 'Técnica de primeros auxilios para asfixia.',
      'image': 'assets/images/heimlich.png',
      'route': '/heimlich',
    },
    {
      'title': 'Tratamiento de Intoxicaciones',
      'description': 'Primeros pasos ante una intoxicación.',
      'image': 'assets/images/intoxicaciones.png',
      'route': '/intoxicaciones',
    },
    {
      'title': 'Cuidados ante Golpes de Calor e Hipotermia',
      'description': 'Prevención y tratamiento para temperaturas extremas.',
      'image': 'assets/images/temperaturas.png',
      'route': '/temperaturas',
    },
    {
      'title': 'Atención a Picaduras y Mordeduras',
      'description': 'Cómo actuar frente a picaduras y mordeduras.',
      'image': 'assets/images/picaduras.png',
      'route': '/picaduras',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeros Auxilios Básicos'),
      ),
      backgroundColor: Color(0xFFDDEAFF), // Fondo de color #DDEAFF
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: firstAids.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Card(
                    color: Colors.white, // Contenedor de color blanco
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Aumento de margen
                    elevation: 4, // Sombra en la parte de abajo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.asset(
                            firstAids[index]['image'] as String,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  firstAids[index]['title'] as String,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold, // Títulos en negritas
                                    fontSize: 16,
                                    color: Color(0xFF468080), // Color de títulos #468080
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  firstAids[index]['description'] as String,
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerRight, // Alinea el botón al centro derecho horizontalmente
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, firstAids[index]['route'] as String);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF589688), // Botones de color #589688
                                      primary: Colors.white, // Letras blancas
                                    ),
                                    child: Text('Ver más'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
