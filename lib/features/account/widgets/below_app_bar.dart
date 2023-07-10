import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:phonedekho/providers/user_provider.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'hello,  ',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                text: user.name,
                style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
