import 'package:desafiogrupal2/src/ui/pagecomponent/filter_component.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scrollbarTheme: ScrollbarThemeData(
          //thumbColor: MaterialStatePropertyAll(Colors.teal),
        )
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//  Parametros a recibir de la clase filtros seria: tamaño del container, colores, los filtros en base
// los datos que estan cargados una variable de tipo funcion para que pueda interactuar con los de mas widgets
// Habra que ver si se ajusta de manera correcta un VoidCallBack para la interaccion o si se debe hacer otro tipo

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _toggled4 = false;
  bool _toggled1 = false;
  bool _toggled2 = false;
  bool _toggled3 = false;
  List<FilterItem> filtros = [
    FilterItem(id:Task.mantenimiento ,text: 'mantenimiento', icon: Icons.ac_unit,backgroundColor: Colors.redAccent),
    FilterItem(id:Task.confeccion, text: 'Confeccion', icon: Icons.construction_rounded, isActive: true),
    FilterItem(id:Task.calidad, text: 'Calidad', icon: Icons.construction_rounded),
    FilterItem(id:Task.jefe_linea, text: 'Jefe linea', icon: Icons.construction_rounded),
    FilterItem(id:Task.jefe_taller, text: 'Jefe taller', icon: Icons.construction_rounded, isActive: true),
    FilterItem(id:Task.capacitacion, text: 'Capacitacion', icon: Icons.construction_rounded),
    FilterItem(id:Task.corte, text: 'Corte', icon: Icons.construction_rounded),
    FilterItem(id:Task.corte, text: 'Corte', icon: Icons.construction_rounded),
    FilterItem(id:Task.corte, text: 'Corte', icon: Icons.construction_rounded),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FilterComponent(switchColor: Colors.teal.shade400,lista: filtros, ), );

  }
}