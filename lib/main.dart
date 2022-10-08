import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterItem{
  String? _text;
  bool? _isActive;
  IconData? _icon;
  Color? _backgroundColor;

  FilterItem(String text,IconData icon){
    _text=text;
    _isActive=false;
    _icon=icon;
    _backgroundColor=Colors.cyan;
  }

  String get text => _text!;

  set text(String value) {
    _text = value;
  }

  bool get isActive => _isActive!;

  set isActive(bool value) {
    _isActive = value;
  }

  IconData get icon => _icon!;

  set icon(IconData value) {
    _icon = value;
  }

  Color get backgroundColor => _backgroundColor!;

  set backgroundColor(Color value) {
    _backgroundColor = value;
  }

  void changeState(){
    isActive=!isActive;
  }

}

void main() {
  runApp(MaterialApp(home: MyApp()));
}




class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<FilterItem> itemFilters=[];

  List<FilterItem> newListItemFilters(List<FilterItem> list){
    FilterItem item1=FilterItem("Mantenimiento 1",Icons.pentagon);
    list.add(item1);
    FilterItem item2=FilterItem("Mantenimiento 2",Icons.add_circle);
    list.add(item2);
    FilterItem item3=FilterItem("Mantenimiento 3",Icons.pentagon);
    list.add(item3);
    FilterItem item4=FilterItem("Mantenimiento 4",Icons.add_circle);
    list.add(item4);
    FilterItem item5=FilterItem("Mantenimiento 5",Icons.pentagon);
    list.add(item5);
    FilterItem item6=FilterItem("Mantenimiento 6",Icons.add_circle);
    list.add(item6);
    FilterItem item7=FilterItem("Mantenimiento 7",Icons.pentagon);
    list.add(item7);
    FilterItem item8=FilterItem("Mantenimiento 8",Icons.add_circle);
    list.add(item8);
    FilterItem item9=FilterItem("Mantenimiento 9",Icons.pentagon);
    list.add(item9);
    FilterItem item10=FilterItem("Mantenimiento 10",Icons.add_circle);
    list.add(item10);
    return list;
  }

  // Widget _showAlert(BuildContext context,List<FilterItem> list){
  //   return showDialog(
  //       context: context,
  //       builder:(_) => AlertDialog(
  //         title: const Text("Filtros"),
  //         content: _contentAlert(list),
  //       )
  //   );
  // }

  void onChangeFunction(FilterItem item){
    item.changeState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
          children: [
            Expanded(child: Container(color: Colors.white24,)),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder:(BuildContext context) => AlertDialog(
                    title: const Text("Filtros"),
                    content: _contentAlert(newListItemFilters(itemFilters)),
              ));
              //_showAlert(context, newListItemFilters(itemFilters));
            },
              child: const Text("Boton loco"),
            ),
            //_contentAlert(newListItemFilters(itemFilters)),
            //_buttonAlert(),
            Expanded(child: Container(color: Colors.red,)),
          ],
        )
    );
  }

  Widget _contentAlert(List<FilterItem> list){
    return SizedBox(
      height: 500,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index){
            return const Divider(height: 15,);
          },
          itemBuilder: (BuildContext context, int index){
            return _itemFilter(list[index]);
          },
        ),
      ),
    );
  }

  Widget _itemFilter(FilterItem item){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: item._backgroundColor,child: Icon(item._icon),),
            const SizedBox(width: 15,),
            Text(item.text)
          ],
        ),
        InkWell(
          onTap: (){setState(() {
            onChangeFunction(item);
          });},
          child: CupertinoSwitch(
          value: item.isActive,
          onChanged: (bool value){
            setState(() {
              item.isActive=value;
            });
          },
        ),)

      ],
    );
  }
}
