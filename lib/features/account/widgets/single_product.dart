import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white
      ),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(10),
        child: Image.network(image,fit: BoxFit.fitHeight,),
      ),
    );
  }
}
