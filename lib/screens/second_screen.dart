import 'package:flutter/material.dart';
import 'third_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myText =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Text(
                  myText,
                  style: GoogleFonts.getFont('Lato'),
                ).p16(),
                Image.network(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg")
                    .p16(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThiScr(),
                      ),
                    );
                  },
                  child: const Text("Click Here"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
