import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/update_prodect_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "ElMessiri",
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffffffff),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProdectPage.id: (context) => const UpdateProdectPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
