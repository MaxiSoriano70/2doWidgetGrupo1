import 'package:desafiogrupal2/src/ui/pagecomponent/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  final Color switchColor;
  const FilterComponent({Key? key, this.switchColor = Colors.cyan})
      : super(key: key);

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  @override
  Widget build(BuildContext context) {
    List<FilterItem> filters = [
      FilterItem(
          id: Task.mantenimiento,
          text: 'Mantenimiento',
          icon: Icons.settings,
          backgroundColor: Colors.grey),
      FilterItem(
        id: Task.confeccion,
        text: 'Corte',
        icon: Icons.content_cut_sharp,
        backgroundColor: Colors.pink.shade200,
      ),
      FilterItem(
          id: Task.jefe_linea,
          text: 'Calidad',
          backgroundColor: Colors.purple.shade300,
          icon: Icons.assignment_ind_outlined),
      FilterItem(
        id: Task.jefe_taller,
        text: 'Jefe taller',
        icon: Icons.groups_outlined,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      FilterItem(
          id: Task.capacitacion,
          text: 'Limpieza',
          backgroundColor: Colors.blue,
          icon: Icons.sanitizer_sharp),
      FilterItem(
          id: Task.corte,
          text: 'Capacitación',
          backgroundColor: Colors.green.shade700,
          icon: Icons.school_sharp),
      FilterItem(
          id: Task.corte,
          text: 'Confección',
          backgroundColor: Colors.deepOrange,
          icon: Icons.person),
      FilterItem(
          id: Task.corte, text: 'Jefe línea', icon: Icons.construction_rounded),
      FilterItem(
          id: Task.corte, text: 'Jefe línea', icon: Icons.construction_rounded),
      FilterItem(
          id: Task.corte, text: 'Jefe línea', icon: Icons.construction_rounded),
    ];
    return _alertDialogCustom(filters);
  }

  _alertDialogCustom(List<FilterItem> filters) {
    return AlertDialog(
      title: _header(),
      titlePadding: const EdgeInsets.symmetric(horizontal: 35),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
                        return _listFilterTwo(filters, setState);
                      })),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            backgroundColor: widget.switchColor,
            text: 'Aceptar',
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(15),
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

  _cellFilterTwo(FilterItem item, StateSetter setState) {
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
                  setState(() {
                    item.onChange();
                  });
                }),
          ],
        ),
      ),
    );
  }

  _listFilterTwo(List<FilterItem> list, StateSetter setState) {
    return ListView.builder(
        itemBuilder: (context, index) => _cellFilterTwo(list[index], setState),
        itemCount: list.length);
  }

// _cellFilter(FilterItem item, StateSetter setState) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 16,
//               backgroundColor: item.backgroundColor,
//               child: Icon(
//                 item.icon,
//                 size: 23,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               item.text,
//               style:
//                   const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 8.0),
//           child: CupertinoSwitch(
//               activeColor: widget.switchColor,
//               value: item.isActive,
//               onChanged: (bool value) {
//                 setState(() {
//                   item.onChange();
//                 });
//               }),
//         ),
//       ],
//     ),
//   );
// }

// _listFilter(List<FilterItem> list, StateSetter setState) {
//   return ListView.separated(
//       itemBuilder: (context, index) => _cellFilter(list[index], setState),
//       separatorBuilder: (context, index) => const Divider(
//             height: 2,
//             indent: 20,
//             endIndent: 30,
//           ),
//       itemCount: list.length);
// }
}

class FilterItem {
  Task id;
  String text;
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
