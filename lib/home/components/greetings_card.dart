import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_consumir_api/home/components/color_palette.dart';

class GreetingsCard extends StatefulWidget {
  const GreetingsCard({Key? key}) : super(key: key);

  @override
  State<GreetingsCard> createState() => _GreetingsCardState();
}

class _GreetingsCardState extends State<GreetingsCard>
    with SingleTickerProviderStateMixin {
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
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
        child: Image.network(
          'https://images.pexels.com/photos/6168064/pexels-photo-6168064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
      ),
    );
  }
}
