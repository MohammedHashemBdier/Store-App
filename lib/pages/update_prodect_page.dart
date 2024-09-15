import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/custom_button.dart';
import 'package:store_app/helper/custom_text_field.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_prouct_service.dart';

class UpdateProdectPage extends StatefulWidget {
  const UpdateProdectPage({
    super.key,
  });
  static String id = "UpdateProdectPage";

  @override
  State<UpdateProdectPage> createState() => _UpdateProdectPageState();
}

String? productName, descripiton, image, price;
bool isLoading = false;

class _UpdateProdectPageState extends State<UpdateProdectPage> {
  @override
  Widget build(BuildContext context) {
    ProductModel prodect =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Prodect",
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 50),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  obscureText: false,
                  hintText: "Prodect Name",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    descripiton = data;
                  },
                  obscureText: false,
                  hintText: "Descripiton",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  obscureText: false,
                  hintText: "Price",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  obscureText: false,
                  hintText: "Image",
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: "Update",
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProuct(prodect);
                      debugPrint("Success");
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<ProductModel> updateProuct(ProductModel prodect) async {
    return await UpdateProuctService().updateProduct(
      id: prodect.id,
      title: productName == null ? prodect.title : productName!,
      price: price == null ? prodect.price.toString() : price!,
      desc: descripiton == null ? prodect.description : descripiton!,
      image: image == null ? prodect.image : image!,
      category: prodect.category,
    );
  }
}
