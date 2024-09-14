import 'package:flutter/material.dart';

class UpdateProdectPage extends StatelessWidget {
  const UpdateProdectPage({super.key});
  static String id = "UpdateProdectPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Prodect",
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
    );
  }
}
