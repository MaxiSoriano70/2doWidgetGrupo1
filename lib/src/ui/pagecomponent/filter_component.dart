import 'package:desafiogrupal2/src/ui/pagecomponent/custom_button.dart';
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
    return Column(
      children: [
        FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
                              width: 400,
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
          'Filtros',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )
      ],
    );
  }

  /*_cell(FilterItem item,StateSetter setState) {
    return SwitchListTile.adaptive(
      activeColor: Colors.cyan,
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
  }*/

  /*_cell(FilterItem item,StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(backgroundColor: item.backgroundColor,child: Icon(item.icon),),
        const SizedBox(width: 15,),
        Text(item.text)
      ],
    ),
    CupertinoSwitch(
    value: item.isActive,
    onChanged: (bool value){
      setState(() {
        item.onChange();
      });
    })]
    );
    }*/
  _cell(FilterItem item,StateSetter setState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(backgroundColor: item.backgroundColor,child: Icon(item.icon,size: 25,),),
              const SizedBox(width: 10,),
              Text(item.text,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
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
    return  Scrollbar(
      child: ListView.separated(
          itemBuilder: (context, index) => _cell( lista[index],setState),
          separatorBuilder: (context, index) => const Divider(height: 2,),
          itemCount:lista.length ),
    );
  }

  _button() {
    return Container(
        // color: Colors.blue,

        child:  CustomButton(
          backgroundColor: widget.switchColor,
          text: 'Aceptar',
          padding: EdgeInsets.symmetric(horizontal: 80,vertical: 10),
        ));
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
