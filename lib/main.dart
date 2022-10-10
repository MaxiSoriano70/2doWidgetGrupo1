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
          thumbColor: MaterialStatePropertyAll(Colors.teal),
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FilterComponent(switchColor: Colors.teal.shade400 ), );

  }
}