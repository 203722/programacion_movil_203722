import 'package:flutter/material.dart';
import 'on_boarding_slide.dart';
import 'package:onboardding_203722/pages/login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  List<Map<String, String>> listBoarding = [
    {
      "tittle": "ESPARCIMIENTO",
      "text": "Brindamos todos los servicios para consentir a tu mascota",
      "image": "assets/images/B1.png"
    },
    {
      "tittle": "ADOPCION",
      "text": "Nulla faucibus tellus ut odio scelerisque vitae molestie lectus feugiat.",
      "image": "assets/images/B2.png"
    },
    {
      "tittle": "HOSPITALIDAD",
      "text": "Nulla faucibus tellus ut odio scelerisque vitae molestie lectus feugiat.",
      "image": "assets/images/B3.png"
    },
    {
      "tittle": "VETERINARIA",
      "text": "Nulla faucibus tellus ut odio scelerisque vitae molestie lectus feugiat.",
      "image": "assets/images/B4.png"
    },
    {
      "tittle": "TIENDA",
      "text": "Compra todas las necesidades de tu mascota sin salir de casa.",
      "image": "assets/images/B5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: listBoarding.length,
            itemBuilder: (context, index) => ContentBoarding(
              tittle: listBoarding[currentPage]["tittle"]!,
              text: listBoarding[currentPage]["text"]!,
              image: listBoarding[currentPage]["image"]!,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            listBoarding.length,
            (index) => Pages(index: index, currentPage: currentPage),
          ),
        ),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buttomBoarding(50, 330, "Boton")],
            )),
      ],
    ));
  }

  buttomBoarding(double height, double width, String test) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
            side: BorderSide(
                color: currentPage == 4
                    ? Color.fromARGB(255, 117, 167, 87)
                    : Color.fromARGB(255, 197, 196, 196),
                width: 2)),
        minimumSize: Size(width, height),
        backgroundColor:
            currentPage == 4 ? Color.fromARGB(255, 117, 167, 87) : Colors.white,
        padding: const EdgeInsets.all(0));
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: TextButton(
        onPressed: cambiarVista,
        style: flatButtonStyle,
        child: Text(currentPage == 4 ? "Continuar" : "Siguiente",
            style: TextStyle(
              fontSize: 20,
              color: currentPage == 4 ? Colors.white : Color.fromARGB(255, 141, 141, 141),
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  void cambiarVista() {
    if (currentPage < 4) {
      setState(() {
        currentPage++;
      });
    }
  }
}

AnimatedContainer Pages({required int index, required int currentPage}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.all(3),
    height: currentPage == index ? 7 : 5,
    width: currentPage == index ? 30 : 20,
    decoration: BoxDecoration(
        color: currentPage == index
            ? Color.fromARGB(255, 252, 17, 94)
            : Color.fromARGB(255, 199, 199, 199),
        borderRadius: BorderRadius.circular(3)),
  );
}
