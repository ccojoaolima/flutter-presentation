import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_consumir_api/home/components/color_palette.dart';
import 'package:get/get.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_consumir_api/home/components/greetings_card.dart';
import 'package:projeto_consumir_api/home/friends_page.dart';
import 'package:projeto_consumir_api/home/model/github_user_model.dart';
import 'package:projeto_consumir_api/home/model/people_model.dart';
import 'package:projeto_consumir_api/home/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late Future<List<PeopleModel>?> persons;
    return GetMaterialApp(
      title: 'Obtendo dados da Web - Exemplo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Typography.blackCupertino),
        primaryColor: ColorPalette.eyeSafeBlack,
        appBarTheme: const AppBarTheme(color: ColorPalette.eyeSafeBlack),
        scaffoldBackgroundColor: ColorPalette.eyeSafeBlack,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Some stuff 'bout me"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 100.0),
          child: Column(
            children: [
              Center(
                child: TextButton(
                  onPressed: () => Get.to(
                    FriendsPage(),
                  ),
                  child: const Text(
                    "Friend List",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () => Get.to(ProfilePage()),
                  child: const Text(
                    "Profile",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Center(
                child: GreetingsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
