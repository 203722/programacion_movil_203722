import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({
    Key? key,
    required this.tittle,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String tittle, text, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Image.asset(
              image,
              width: 300,
              height: 300,
            ),
            Text(
              tittle,
              style: const TextStyle(
                color: Color.fromARGB(255, 83, 37, 162),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            )
          ]),
          Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                ),
              ))
        ],
      ),
    );
  }
}
