import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({Key? key}) : super(key: key);

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  late Toggle toggle;
  bool _toggled4 = false;
  bool _toggled1 = false;
  bool _toggled2 = false;
  bool _toggled3 = false;

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    insetPadding: EdgeInsets.all(20),
                    // icon: const SizedBox(
                    //     height: 20,
                    //     width: 20,
                    //     child: Align(
                    //         alignment: Alignment.topRight,
                    //         child: CloseButton())),
                    // iconPadding: EdgeInsets.zero,
                    // buttonPadding: EdgeInsets.zero,
                    // scrollable: true,
                    child: Column(
                      children: [
                        _header(),
                        const Divider(
                          thickness: 2.5,
                        ),
                        SizedBox(
                            height: 450,
                            width: 300,
                            child: SingleChildScrollView(child: _body())),
                        const SizedBox(
                          height: 20,
                        ),
                        _button(),
                      ],
                    ),
                  );
                });
          }
          );
  }

  Center _bodyTest() {
    return Center(
      child: Column(
        children: <Widget>[
          Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Container(
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
                      onChanged: (bool value) {
                        setState(() {
                          _toggled4 = value;
                        });
                      },
                      title: const Text('Toggle 3'),
                      secondary: const Icon(Icons.add_chart),
                    )
                  ]),
                ),
              ))
        ],
      ),
    );
  }

  Widget _header() {
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

  Widget _body() {
    return Column(children: <Widget>[
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
        contentPadding: const EdgeInsets.all(3),
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
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
          });
        },
        title: const Text('Toggle 3'),
        secondary: const Icon(Icons.add_chart),
      ),
      const Divider(),
      SwitchListTile(
        contentPadding: const EdgeInsets.all(3),
        value: _toggled4,
        onChanged: (bool value) {
          setState(() {
            _toggled4 = value;
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
