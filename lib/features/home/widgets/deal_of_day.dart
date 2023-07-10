import 'package:flutter/material.dart';

class DealDay extends StatefulWidget {
  const DealDay({Key? key}) : super(key: key);

  @override
  State<DealDay> createState() => _DealDayState();
}

class _DealDayState extends State<DealDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            'Deal os the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          "https://gaadiwaadi.com/wp-content/uploads/2022/03/Charge-Cars-1967-Ford-Mustang-EV-img1-740x463.jpg",
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            '\$50000',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 5, right: 40),
          child: Text(
            'Chetan',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://photos5.appleinsider.com/gallery/28366-43968-MacBook-Air-2018-Space-Gray-xl.jpg",
                fit: BoxFit.fitWidth,
                width: 50,
                height: 50,
              ),
              Image.network(
                "https://photos5.appleinsider.com/gallery/28366-43968-MacBook-Air-2018-Space-Gray-xl.jpg",
                fit: BoxFit.fitWidth,
                width: 50,
                height: 50,
              ),
              Image.network(
                "https://photos5.appleinsider.com/gallery/28366-43968-MacBook-Air-2018-Space-Gray-xl.jpg",
                fit: BoxFit.fitWidth,
                width: 50,
                height: 50,
              ),
              Image.network(
                "https://photos5.appleinsider.com/gallery/28366-43968-MacBook-Air-2018-Space-Gray-xl.jpg",
                fit: BoxFit.fitWidth,
                width: 50,
                height: 50,
              ),
              Image.network(
                "https://photos5.appleinsider.com/gallery/28366-43968-MacBook-Air-2018-Space-Gray-xl.jpg",
                fit: BoxFit.fitWidth,
                width: 50,
                height: 50,
              ),

            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        )
      ],
    );
  }
}
