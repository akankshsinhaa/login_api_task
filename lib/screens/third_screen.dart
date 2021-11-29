import 'package:flutter/material.dart';

class ThiScr extends StatefulWidget {
  const ThiScr({Key? key}) : super(key: key);

  @override
  State<ThiScr> createState() {
    return _ThirdState();
  }
}

class _ThirdState extends State<ThiScr> {
  String? value;
  final items = [
    "Education",
    "Recreational",
    "Social",
    "DIY",
    "Charity",
    "Cooking",
    "Relaxation",
    "Music",
    "Busywork",
    "Random"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('API Implementation'),
          centerTitle: true,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DropdownButton<String>(
            icon: const Icon(Icons.arrow_drop_down),
            dropdownColor: Colors.blue,
            value: value,
            items: items.map(buildMenuItem).toList(),
            //String value is used
            onChanged: (value) => this.value = value,
          ),
          const SizedBox(width: 100),
          ElevatedButton(
              onPressed: () => print('Short Pressed'), child: Text("Implement"))
        ])));
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
