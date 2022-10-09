import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({Key? key}) : super(key: key);

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {


  @override
  Widget build(BuildContext context) {
    List<FilterItem> filtros = [
      FilterItem(id:Task.mantenimiento ,text: 'mantenimiento', icon: Icons.ac_unit,backgroundColor: Colors.redAccent),
      FilterItem(id:Task.confeccion, text: 'Confeccion', icon: Icons.construction_rounded, isActive: true),
      FilterItem(id:Task.calidad, text: 'Calidad', icon: Icons.construction_rounded),
      FilterItem(id:Task.jefe_linea, text: 'Jefe linea', icon: Icons.construction_rounded),
      FilterItem(id:Task.jefe_taller, text: 'Jefe taller', icon: Icons.construction_rounded, isActive: true),
      FilterItem(id:Task.capacitacion, text: 'Capacitacion', icon: Icons.construction_rounded),
      FilterItem(id:Task.corte, text: 'Corte', icon: Icons.construction_rounded),
    ];
    return Column(
      children: [
        FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      icon: const SizedBox(
                          height: 20,
                          width: 20,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: CloseButton())),
                      iconPadding: EdgeInsets.zero,
                      buttonPadding: EdgeInsets.zero,
                      scrollable: true,
                      content: Column(
                        children: [
                          _header(),
                          const Divider(thickness: 2.5,),
                          SizedBox(
                              height: 450,
                              width: 300,
                              child: StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return _list(filtros,setState);
                              })),
                          const SizedBox(height: 20,),
                          _button(),
                        ],
                      ),
                    );
                  });
            }),
      ],
    );
  }



  _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Filters',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )
      ],
    );
  }

  _cell(FilterItem item,StateSetter setState) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.all(3),
      value: item.isActive,
      onChanged: (bool value) {
        setState(() {
          item.onChange();
        });
      },
      title: Text(item.text),
      secondary: Icon(item.icon, color: item.backgroundColor,),
    );
  }

  _list(List<FilterItem> lista,StateSetter setState) {
    return  ListView.separated(
        itemBuilder: (context, index) => _cell( lista[index],setState),
        separatorBuilder: (context, index) => const Divider(height: 2,),
        itemCount:lista.length );
  }

  _button() {
    return Container(
        // color: Colors.blue,
        width: 300,
        child: const ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            onPressed: null,
            child: Text(
              'Aceptar',
              style: TextStyle(color: Colors.white),
            )));
  }
}

class FilterItem {
  Task id;
  String text;
  bool isActive;
  IconData icon;
  Color backgroundColor;


  FilterItem({
      required this.id,
      required this.text,
      required this.icon,
      this.isActive = false,
      this.backgroundColor = Colors.lightGreenAccent});

  void onChange() {
    isActive = !isActive;
  }

}

enum Task {
  mantenimiento,
  corte,
  calidad,
  jefe_taller,
  limpieza,
  capacitacion,
  confeccion,
  jefe_linea
}
