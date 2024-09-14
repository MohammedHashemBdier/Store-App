import 'package:flutter/material.dart';
import 'package:store_app/helper/custom_button.dart';
import 'package:store_app/helper/custom_text_from_field.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormTextField(
              obscureText: false,
              hintText: "Prodect Name",
            ),
            SizedBox(height: 10),
            CustomFormTextField(
              obscureText: false,
              hintText: "Descripiton",
            ),
            SizedBox(height: 10),
            CustomFormTextField(
              obscureText: false,
              hintText: "Price",
            ),
            SizedBox(height: 10),
            CustomFormTextField(
              obscureText: false,
              hintText: "Image",
            ),
            SizedBox(height: 50),
            CustomButton(
              text: "Update",
            )
          ],
        ),
      ),
    );
  }
}
