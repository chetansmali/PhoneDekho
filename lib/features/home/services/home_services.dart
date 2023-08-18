import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phonedekho/constants/error_handling.dart';
import 'package:phonedekho/constants/utils.dart';
import 'package:phonedekho/models/product.dart';
import 'package:phonedekho/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:http/http.dart' as http;

class HomeService{
  Future<List<Product>> fetchCategoryProduct({
    required BuildContext context,
    required String category})  async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/products?category=$category'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'x-auth-token': userProvider.user.token,
          });

      print(res.body);

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
}