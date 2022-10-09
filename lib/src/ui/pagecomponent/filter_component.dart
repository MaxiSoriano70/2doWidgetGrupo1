import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({Key? key}) : super(key: key);

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  late Toggle toggle;
  bool toggled4 = false;
  bool toggled1 = false;
  bool toggled2 = false;
  bool toggled3 = false;

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                                const Divider(
                                  thickness: 2.5,
                                ),
                                SizedBox(
                                    height: 450,
                                    width: 300,
                                    child: StatefulBuilder(
                                      builder:(BuildContext context, StateSetter setState){
                                      return _body(setState);
                                    }
                                )),
                                const SizedBox(
                                  height: 20,
                                ),
                                _button( ),

                              ],
                            ),
                      );
                    });
              }
              ),
      ],
    );
  }

  /*Center _bodyTest() {
    return Center(
      child: Column(
        children: <Widget>[
          AlertDialog(
              content: Container(
                height: 150,
                width: 75,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Text('data'),
                    Divider(),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(3),
                      value: _toggled1,
                      onChanged: (bool value) {
                        setState(() {
                          _toggled1 = value;
                        });
                      },
                      title: const Text('Toggle'),
                      secondary: const Icon(Icons.ac_unit),
                    ),
                    const Divider(),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(3),
                      value: _toggled2,
                      onChanged: (bool value) {
                        setState(() {
                          _toggled2 = value;
                        });
                      },
                      title: const Text('Toggle 1'),
                      secondary: const Icon(Icons.add_alert_outlined),
                    ),
                    const Divider(),
                    SwitchListTile(
                      value: _toggled3,
                      onChanged: (bool value) {
                        setState(() {
                          _toggled3 = value;
                        });
                      },
                      title: const Text('Toggle 2'),
                      secondary: const Icon(Icons.adb),
                    ),
                    const Divider(),
                    SwitchListTile(
                      value: _toggled4,
                      onChanged: (bool ola) {
                        setState(() {
                          _toggled4 = ola;
                        });
                      },
                      title: const Text('Toggle 3'),
                      secondary: const Icon(Icons.add_chart),
                    )
                  ]),
                ),
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))))
        ],
      ),
    );
  }*/

  Widget _header() {
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

   _body(StateSetter setState) {
    return Column(children: <Widget>[
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: toggled1,
        onChanged: (bool value) {
          setState(() {
            toggled1 = value;
          });
        },
        title: const Text('Toggle'),
        secondary: const Icon(Icons.ac_unit),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: toggled2,
        onChanged: (bool value) {
          setState(() {
            toggled2 = value;
          });
        },
        title: const Text('Toggle 1'),
        secondary: const Icon(Icons.add_alert_outlined),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: toggled3,
        onChanged: (bool value) {
          setState(() {
            toggled3 = value;
          });
        },
        title: const Text('Toggle 2'),
        secondary: const Icon(Icons.adb),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: toggled4,
        onChanged: (bool value) {
          setState(() {
            print('cambiando estado');
            toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),

    ]);
  }

  Widget _button() {
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

enum Toggle { one, two, three, four }
