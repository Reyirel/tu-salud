import 'package:flutter/material.dart';
import 'inicio.dart'; // Importa la pantalla de inicio
// Importa las pantallas a las que se navegará
import 'atencion_convulsiones_screen.dart';
import 'atencion_picaduras_mordeduras_screen.dart';
import 'atencion_quemaduras_screen.dart';
import 'control_hemorragias_screen.dart';
import 'cuidados_golpes_calor_hipotermia_screen.dart';
import 'dea_screen.dart';
import 'manejo_fracturas_lesiones_screen.dart';
import 'maniobra_heimlich_screen.dart';
import 'rcp_screen.dart';
import 'tratamiento_intoxicaciones_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeros Auxilios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstAidHomePage(), // La pantalla de inicio se maneja desde inicio.dart
      // Define las rutas a las pantallas
      routes: {
        '/rcp': (context) => RCPScreen(),
        '/dea': (context) => DEAScreen(),
        '/hemorragias': (context) => ControlHemorragiasScreen(),
        '/quemaduras': (context) => AtencionQuemadurasScreen(),
        '/fracturas': (context) => ManejoFracturasLesionesScreen(),
        '/convulsiones': (context) => AtencionConvulsionesScreen(),
        '/heimlich': (context) => ManiobraHeimlichScreen(),
        '/intoxicaciones': (context) => TratamientoIntoxicacionesScreen(),
        '/temperaturas': (context) => CuidadosGolpesCalorHipotermiaScreen(),
        '/picaduras': (context) => AtencionPicadurasMordedurasScreen(),
      },
    );
  }
}
