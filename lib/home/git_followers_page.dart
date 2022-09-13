import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_consumir_api/home/components/card_error.dart';
import 'package:projeto_consumir_api/home/components/card_friends.dart';
import 'package:projeto_consumir_api/home/components/card_git_follower.dart';
import 'package:projeto_consumir_api/home/components/color_palette.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_consumir_api/home/model/git_followers_model.dart';
import 'package:projeto_consumir_api/home/model/people_model.dart';

Future<List<GitHubFollowers>?> fetchPost() async {
  final response =
  await http.get(Uri.parse("https://api.github.com/users/ccojoaolima/followers"));
  if (response.statusCode == 200) {
    print(response.body);
    return GitHubFollowers.listGitFollowers(response.body);
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

class GitFollowersPage extends StatefulWidget {
  const GitFollowersPage({Key? key}) : super(key: key);

  @override
  State<GitFollowersPage> createState() => _GitFollowersPage();
}

class _GitFollowersPage extends State<GitFollowersPage> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<GitHubFollowers>?>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.data != null &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardGitFollower(gitHubFollowerModel: snapshot.data![index]),
              );
            },
          );
        } else if (snapshot.data == null &&
            snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data == null &&
            snapshot.connectionState == ConnectionState.done) {
          return const CardError();
        };
        return Text("Erro inesperado, contate o administrador.");
      },
    );
  }
}
