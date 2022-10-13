
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
  List<FilterItem> filtros = [
    FilterItem(
        id: 1,
        title: 'Mantenimiento',
        icon: Icons.settings,
        iconBackgroundColor:Colors.grey),
    FilterItem(
      id: 2,
      title: 'Corte',
      icon: Icons.content_cut_sharp,
      iconBackgroundColor: Colors.pink.shade200,
    ),
    FilterItem(
        id: 3,
        title: 'Calidad',
        iconBackgroundColor: Colors.purple.shade300,
        icon: Icons.assignment_ind_outlined),
    FilterItem(
      id: 4,
      title: 'Jefe taller',
      icon: Icons.groups_outlined,
      iconBackgroundColor:  Colors.deepPurpleAccent,
    ),
    FilterItem(
        id: 5,
        title: 'Limpieza',
        iconBackgroundColor: Colors.blue,
        icon: Icons.sanitizer_sharp),
    FilterItem(
        id: 6,
        title: 'Capacitación',
        iconBackgroundColor: Colors.green.shade700,
        icon: Icons.school_sharp),
    FilterItem(
        id: 7,
        title: 'Confección',
        iconBackgroundColor: Colors.deepOrange,
        icon: Icons.person),
    FilterItem(id: 8, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 9, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 10, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 11, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 12, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 13, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 14, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 15, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 16, title: 'Jefe línea', icon: Icons.construction_rounded),
    FilterItem(id: 17, title: 'Jefe línea', icon: Icons.construction_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return
              FilterComponent(color: Colors.teal.shade400, items: filtros,onTap: (lista){print(lista);},); }
          );
            }
          )
        );}

  }