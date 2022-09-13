import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_consumir_api/home/components/color_palette.dart';

import '../model/github_user_model.dart';

class CardGitUser extends StatefulWidget {
  final GitHubUser gitHubUser;


  const CardGitUser({Key? key, required this.gitHubUser}) : super(key: key);

  @override
  State<CardGitUser> createState() => _CardGitUserState();
}

class _CardGitUserState extends State<CardGitUser> with SingleTickerProviderStateMixin {
  final double _opacityLevel = 5;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..animateBack(_opacityLevel);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 2.5),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        color: ColorPalette.darkPurple,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(widget.gitHubUser.avatarUrl),
              ),
            ),
            Text(
              widget.gitHubUser.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                color: ColorPalette.eyeSafeWhite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 40.0),
              child: Text(
                textAlign: TextAlign.center,
                widget.gitHubUser.bio,
                style: const TextStyle(
                  color: ColorPalette.eyeSafeWhite,
                ),
              ),
            ),
            Text(
             textAlign: TextAlign.center,
             widget.gitHubUser.location,
              style: const TextStyle(
                color: ColorPalette.eyeSafeWhite,
                fontSize: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
