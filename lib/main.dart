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
  List<FilterItem> filters = [
    FilterItem(
        id: 0,
        text: 'Mantenimiento',
        icon: Icons.settings,
        backgroundColor: Colors.grey),
    FilterItem(
      id: 1,
      text: 'Corte',
      icon: Icons.content_cut_sharp,
      backgroundColor: Colors.pink.shade200,
    ),
    FilterItem(
        id: 2,
        text: 'Calidad',
        backgroundColor: Colors.purple.shade300,
        icon: Icons.assignment_ind_outlined),
    FilterItem(
      id: 3,
      text: 'Jefe taller',
      icon: Icons.groups_outlined,
      backgroundColor: Colors.deepPurpleAccent,
    ),
    FilterItem(
        id: 4,
        text: 'Limpieza',
        backgroundColor: Colors.blue,
        icon: Icons.sanitizer_sharp),
    FilterItem(
        id: 5,
        text: 'Capacitación',
        backgroundColor: Colors.green.shade700,
        icon: Icons.school_sharp),
    FilterItem(
        id: 6,
        text: 'Confección',
        backgroundColor: Colors.deepOrange,
        icon: Icons.person),
    FilterItem(
        id: 7, text: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(
        id: 8, text: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(
        id: 9, text: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(
        id: 10, text: 'Jefe línea', icon: Icons.construction_rounded),
  ];
  @override
  Widget build(BuildContext context) {
    return
/*      Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return*/
              FilterComponent(switchColor: Colors.teal.shade400, items: filters, onTap: () => print(filters[text]),
        //   },
        // );
      // }),
    );
  }
}