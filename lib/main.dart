import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container(color: Colors.grey,)),
          AlertDialogContenido(),
          Expanded(child: Container(color: Colors.grey,)),
        ],
      ),
    );
  }
}


class AlertDialogContenido extends StatefulWidget {
  const AlertDialogContenido({Key? key}) : super(key: key);
  @override
  State<AlertDialogContenido> createState() => _AlertDialogContenidoState();
}

class _AlertDialogContenidoState extends State<AlertDialogContenido> {
  bool selected=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Item(selected),
            const Divider(),
            Item(selected),
            const Divider(),
            Item(selected),
            const Divider(),
            Item(selected),
            const Divider(),
            Item(selected),
            const Divider(),
            Item(selected),
            const Divider(),
            Item(selected),

          ],
        ),
      ),
    );
  }
  Widget Item(bool value){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(child: Icon(Icons.confirmation_num),),
              SizedBox(width: 5,),
              Text("Mantenimiento",style: TextStyle(fontSize: 20,color: Colors.black),)
            ],
          ),
          FlutterSwitch(
              activeColor: Colors.cyan,
              value: value,
              onToggle: (bool value){
                setState(() {
                  value=!value;
                });
              })
        ],
      ),
    );
  }
}
