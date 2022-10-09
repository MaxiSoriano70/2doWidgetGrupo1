import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  final  Color switchColor;
  const FilterComponent({Key? key,this.switchColor=Colors.cyan }) : super(key: key);

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  @override
  Widget build(BuildContext context) {
    List<FilterItem> filtros = [
      FilterItem(id:Task.mantenimiento ,text: 'Mantenimiento', icon: Icons.settings,backgroundColor: Colors.redAccent),
      FilterItem(id:Task.corte, text: 'Corte', icon: Icons.thumb_up, isActive: true,backgroundColor: Colors.cyan),
      FilterItem(id:Task.calidad, text: 'Calidad', icon: Icons.assignment_turned_in_outlined,backgroundColor: Colors.green),
      FilterItem(id:Task.jefe_taller, text: 'Jefe Taller', icon: Icons.construction_rounded,backgroundColor: Colors.indigoAccent),
      FilterItem(id:Task.limpieza, text: 'Limpieza', icon: Icons.clear, isActive: true,backgroundColor: Colors.pinkAccent),
      FilterItem(id:Task.capacitacion, text: 'Capacitación', icon: Icons.insights,backgroundColor: Colors.brown),
      FilterItem(id:Task.confeccion, text: 'Confección', icon: Icons.safety_check_rounded,backgroundColor: Colors.blue),
      FilterItem(id:Task.jefe_linea, text: 'Jefe Línea', icon: Icons.person,backgroundColor: Colors.purple),
      FilterItem(id:Task.corte, text: 'SAPE', icon: Icons.assignment_late_outlined,backgroundColor: Colors.lime),
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
                      title: Column(
                        children: const [
                          Center(child: Text(
                            'Filtros',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),),
                          Divider(thickness: 2.5,),
                        ],
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      /*icon: const SizedBox(
                          height: 20,
                          width: 20,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: CloseButton())),
                      iconPadding: EdgeInsets.zero,*/
                      /*buttonPadding: EdgeInsets.zero,*/
                      contentPadding: const EdgeInsets.fromLTRB(0, 25.0, 0, 25.0),
                      //scrollable: true,
                      content: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 450,
                                child: StatefulBuilder(builder:
                                    (BuildContext context, StateSetter setState) {
                                  return _list(filtros,setState);
                                })),
                            const SizedBox(height: 20,),
                            /*_button(),*/
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ],
    );
  }

  _cell(FilterItem item,StateSetter setState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: item.backgroundColor,
                ),
                child: Icon(item.icon,size: 25,color: Colors.white,),
              ),
              /*CircleAvatar(backgroundColor: item.backgroundColor,child: Icon(item.icon,size: 20,color: Colors.white,),),*/
              const SizedBox(width: 10,),
              Text(item.text,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
            ],
          ),
          CupertinoSwitch(
              activeColor: widget.switchColor,
              value: item.isActive,
              onChanged: (bool value) {
                setState(() {
                  item.onChange();
                });
              }
          ),
        ],
      ),
    );
  }

  _list(List<FilterItem> lista,StateSetter setState) {
    return Scrollbar(
      interactive: true,
      thumbVisibility: true,
      trackVisibility: true,
      showTrackOnHover: true,
      thickness: 5,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            itemBuilder: (context, index) => _cell( lista[index],setState),
            separatorBuilder: (context, index) => const Divider(height: 2,),
            itemCount:lista.length 
      ),
    );
  }

  /*_button() {
    return Container(
        child: CustomButton(
          backgroundColor: widget.switchColor,
          text: 'Aceptar',
          padding: EdgeInsets.symmetric(horizontal: 80,vertical: 10),
        )
    );
  }*/
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