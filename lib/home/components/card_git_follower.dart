import 'package:flutter/material.dart';
import 'package:projeto_consumir_api/home/components/color_palette.dart';
import 'package:projeto_consumir_api/home/model/git_followers_model.dart';
import 'package:projeto_consumir_api/home/model/people_model.dart';

class CardGitFollower extends StatefulWidget {
  final GitHubFollowers gitHubFollowerModel;

//, required this.peopleModel
  const CardGitFollower({Key? key, required this.gitHubFollowerModel}) : super(key: key);

  @override
  State<CardGitFollower> createState() => _CardGitFollowers();
}

class _CardGitFollowers extends State<CardGitFollower>
    with SingleTickerProviderStateMixin {
  final double _opacityLevel = 5;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..animateBack(_opacityLevel);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(2.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  Color _colorContainer = ColorPalette.slightlyLighterPurple;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Card(
        borderOnForeground: false,
        shadowColor: ColorPalette.darkPurple,
        color: _colorContainer,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(widget.gitHubFollowerModel.avatarUrl),
          ),
          textColor: ColorPalette.eyeSafeWhite,
          subtitle: Text(
            widget.gitHubFollowerModel.url,
            style: const TextStyle(color: ColorPalette.eyeSafeWhite),
          ),
          title: Text(widget.gitHubFollowerModel.login),
          onLongPress:() {
            setState(() {
              _colorContainer = _colorContainer == ColorPalette.slightlyLighterPurple ?
              ColorPalette.pink :
              ColorPalette.slightlyLighterPurple;
            });
          },
        ),
      ),
    );
  }
}
