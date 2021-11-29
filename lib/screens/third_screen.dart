import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThiScr extends StatefulWidget {
  const ThiScr({Key? key}) : super(key: key);

  @override
  State<ThiScr> createState() {
    return _ThirdState();
  }
}

class _ThirdState extends State<ThiScr> {
  String _activity = "";
  String _accessibility = "";
  String _type = "";
  String _participants = "";
  String _price = "";

  String? value = "random";
  final items = [
    "education",
    "recreational",
    "social",
    "diy",
    "charity",
    "cooking",
    "relaxation",
    "music",
    "busywork",
    "random"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Implementation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              dropdownColor: Colors.blue,
              value: value,
              items: items.map(buildMenuItem).toList(),
              //String value is used
              onChanged: (value) {
                this.value = value;
                setState(() {});
              },
            ),
            const SizedBox(width: 100),
            ElevatedButton(
              onPressed: () async {
                var url = Uri();
                if (value == "random") {
                  url = Uri.parse('http://www.boredapi.com/api/activity');
                } else {
                  url = Uri.parse(
                      'http://www.boredapi.com/api/activity?type=' + value!);
                }
                var response = await http.get(url);
                var data = jsonDecode(response.body);
                _activity = data["activity"].toString();
                _type = data["type"].toString();
                _accessibility = data["accessibility"].toString();
                _participants = data["participants"].toString();
                _price = data["price"].toString();
                setState(() {});
              },
              child: const Text("Implement"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Activity: \n\t\t\t\t".toUpperCase() + _activity),
                  Text("Type: \n\t\t\t\t".toUpperCase() + _type),
                  Text("Accessibility: \n\t\t\t\t".toUpperCase() +
                      _accessibility),
                  Text(
                      "Participants: \n\t\t\t\t".toUpperCase() + _participants),
                  Text("Price: \n\t\t\t\t".toUpperCase() + _price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
