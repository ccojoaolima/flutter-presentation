import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_consumir_api/home/components/card_error.dart';
import 'package:projeto_consumir_api/home/components/card_friends.dart';
import 'package:projeto_consumir_api/home/components/color_palette.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_consumir_api/home/model/people_model.dart';

Future<List<PeopleModel>?> fetchPost() async {
  final response =
      await http.get(Uri.parse("https://randomuser.me/api/?results=9"));
  if (response.statusCode == 200) {
    return PeopleModel.listPeopleModel(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<PeopleModel>?>(
      future: fetchPost(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.data != null &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardFriends(peopleModel: snapshot.data![index]),
              );
            },
          );
        } else if (snapshot.data == null &&
            snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data == null &&
            snapshot.connectionState == ConnectionState.done) {
          return const CardError();
        }
        return Text("aff lista vazia cara");
      },
    );
  }
}
