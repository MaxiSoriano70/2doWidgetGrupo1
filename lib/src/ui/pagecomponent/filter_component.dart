import 'package:desafiogrupal2/src/ui/pagecomponent/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterComponent extends StatelessWidget {
  final  Color switchColor;
  List<FilterItem>? lista = [];
  Function(Task)? onTap;
  FilterComponent({Key? key,this.switchColor=Colors.cyan,this.lista, this.onTap }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Task> activeFilters = [];
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),),
                          Divider(thickness: 2.5,),
                        ],
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0))),
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

                          SizedBox(
                              height: 450,
                              width: 400,
                              child: StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return _list( setState);
                              })),
                          const SizedBox(height: 20,),
                        ],
                      ),

                      actionsPadding: const EdgeInsets.only(bottom: 25),
                      actions: [Center(child: CustomButton(
                        backgroundColor: switchColor,
                        text: 'Aceptar',
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 10),
                      ),)
                      ],
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
              activeColor:  switchColor,
              value: item.isActive,
              onChanged: (bool value) {
                if(value){

                }
                setState(() {
                  item.onChange();
                });
              }
          ),

        ],
      ),
    );
  }

  _list( StateSetter setState) {
    return  RawScrollbar(

      fadeDuration: Duration(milliseconds: 0),
      controller: ScrollController(initialScrollOffset: 0,),
      trackVisibility: true,
      trackColor: Colors.grey,
      thumbVisibility: true,
      thickness: 3,
      thumbColor: Colors.teal,
      //minOverscrollLength: 2,

      child: ListView.separated(
          itemBuilder: (context, index) => _cell( lista![index],setState),
          separatorBuilder: (context, index) => const Divider(height: 2,),
          itemCount:lista!.length ),
    );
  }

  _button() {
    return Container(
        child:  CustomButton(
          backgroundColor:  switchColor,
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
