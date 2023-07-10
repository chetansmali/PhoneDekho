import 'package:flutter/material.dart';
import 'package:phonedekho/features/account/widgets/account_button.dart';

class TopButton extends StatefulWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTab: (){}),
            AccountButton(text: 'Turn Seller', onTab: (){}),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(text: 'Log Out', onTab: (){}),
            AccountButton(text: 'Your Wish List', onTab: (){}),
          ],
        ),
      ],
    );
  }
}
