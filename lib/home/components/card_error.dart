import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_consumir_api/home/components/color_palette.dart';

class CardError extends StatefulWidget {
  const CardError({Key? key}) : super(key: key);

  @override
  State<CardError> createState() => _CardErrorState();
}

class _CardErrorState extends State<CardError> with SingleTickerProviderStateMixin{
  final double _opacityLevel = 5;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..animateBack(_opacityLevel);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, -5.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(
        position: _offsetAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.network(
                  width: 300.0,
                  "https://images.pexels.com/photos/1888015/pexels-photo-1888015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            const Text(
              "Ah não!",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorPalette.pink, fontSize: 40.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 40.0),
              child: Text(
                "Parece que houve um erro\n Confira sua conexão com a Internet\n e tente novamente.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPalette.eyeSafeWhite,
                  fontWeight: FontWeight.w100,
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
