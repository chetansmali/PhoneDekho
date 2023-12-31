import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:phonedekho/constants/error_handling.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:phonedekho/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:phonedekho/models/product.dart';
import 'package:phonedekho/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProducts({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dkwyagtfl', 'kytbabju');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response result = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
          response: result,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product Added successfully');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get all product
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-product'),
              headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'x-auth-token': userProvider.user.token,
              });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i=0; i<jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                  jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required product,
    required VoidCallback onSuccess,
  }) async {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      try {
      http.Response result = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({'id' : product.id, }),
      );

      httpErrorHandle(
          response: result,
          context: context,
          onSuccess: () {
            onSuccess();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
