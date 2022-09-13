import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_consumir_api/home/components/card_error.dart';
import 'package:projeto_consumir_api/home/components/card_git_user.dart';
import 'package:projeto_consumir_api/home/git_followers_page.dart';
import 'package:projeto_consumir_api/home/model/github_user_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

Future<GitHubUser?> fetchPost() async {
  final response = await http.get(Uri.parse("https://api.github.com/users/ccojoaolima"));
  if (response.statusCode == 200) {
    print("entrei aqui");
    return GitHubUser.getUser(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
      child: FutureBuilder<GitHubUser?>(
        future: fetchPost(),
        builder: (context, snapshot){
         print(snapshot);
         if(snapshot.data !=null && snapshot.connectionState == ConnectionState.done){
           return Column(
             children: [
               CardGitUser(gitHubUser: snapshot.data!),
              TextButton(
                 onPressed: () => Get.to(GitFollowersPage()),
                 child: const Text(
                   "Ver meus seguidores",
                   style: TextStyle(fontSize: 20),
                 ),
               ),
             ],
           );
         }else if(snapshot.connectionState == ConnectionState.waiting){
           return CircularProgressIndicator();
         }
         return CardError();
        },
      ),
    );
  }
}
