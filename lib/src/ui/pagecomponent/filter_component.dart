import 'package:desafiogrupal2/src/ui/pagecomponent/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  final Color switchColor;
  final List<FilterItem>? items;
  final Function(List<Task>)? onTap;
  const FilterComponent({Key? key, this.switchColor = Colors.cyan, this.items, this.onTap})
      : super(key: key);

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  ScrollController scrollController = ScrollController();
  List<Task> active  = [];

  @override
  Widget build(BuildContext context) {

    return _alertDialogCustom(widget.items!);
  }

  _alertDialogCustom(List<FilterItem> filters) {
    return AlertDialog(
      title: _header(),
      titlePadding: const EdgeInsets.symmetric(horizontal: 35),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      icon: _buttonClose(),
      iconPadding: const EdgeInsets.only(top: 8, right: 8),
      content: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 450,
                      width: 300,
                      child: StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                        return _listFilter(filters, setState);
                      })),
                ],
              ),
            ),
          ),

        ],
      ),
      contentPadding: const EdgeInsets.all(15),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 25),
      actions: [
        CustomButton(
          backgroundColor: widget.switchColor,
          text: 'Aceptar',
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          onTap:(){ widget.onTap!(active);},
        ),
      ],
    );
  }

  _buttonClose() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [CloseButton()],
    );
  }

  _header() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: const Padding(
        padding: EdgeInsets.only(bottom: 12.0),
        child: Text(
          'Filtros',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  _cellFilter(FilterItem item, StateSetter setState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: item.backgroundColor,
                  child: Icon(
                    item.icon,
                    size: 23,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  item.text,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            CupertinoSwitch(
                activeColor: widget.switchColor,
                value: item.isActive,
                onChanged: (bool value) {
                  if(value){
                    active.add(item.id);
                  }
                  else {
                    active.remove(item.id);
                  }
                  setState(() {
                    item.onChange();
                  });
                }),
          ],
        ),
      ),
    );
  }

  _listFilter(List<FilterItem> list, StateSetter setState) {
    return RawScrollbar(
      controller: scrollController,
      thumbVisibility: true,
      thickness: 5,
      thumbColor: widget.switchColor,
      trackVisibility: true,
      trackColor: Colors.grey,
      trackRadius: const Radius.circular(5),
      radius: const Radius.circular(5),
      child: ListView.builder(
        controller: scrollController,
          itemBuilder: (context, index) => _cellFilter(list[index], setState),
          itemCount: list.length),
    );
  }


}

class FilterItem {
  Task id;
  String text;//name o label o title
  bool isActive;
  IconData icon;
  Color backgroundColor;

  FilterItem(
      {required this.id,
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
