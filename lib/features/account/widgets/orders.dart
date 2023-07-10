import 'package:flutter/material.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:phonedekho/features/account/widgets/single_product.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  //tempary list
  List list=[
    'https://www.businessinsider.in/thumb/msid-95434919,width-640,height-480,imgsize-65068/A-startup-is-reviving-the-classic-1967-Mustang-as-a-brand-new-450000-electric-sports-car.jpg',
    'https://www.businessinsider.in/thumb/msid-95434919,width-640,height-480,imgsize-65068/A-startup-is-reviving-the-classic-1967-Mustang-as-a-brand-new-450000-electric-sports-car.jpg',
    'https://www.businessinsider.in/thumb/msid-95434919,width-640,height-480,imgsize-65068/A-startup-is-reviving-the-classic-1967-Mustang-as-a-brand-new-450000-electric-sports-car.jpg',
    'https://www.businessinsider.in/thumb/msid-95434919,width-640,height-480,imgsize-65068/A-startup-is-reviving-the-classic-1967-Mustang-as-a-brand-new-450000-electric-sports-car.jpg',
    'https://www.businessinsider.in/thumb/msid-95434919,width-640,height-480,imgsize-65068/A-startup-is-reviving-the-classic-1967-Mustang-as-a-brand-new-450000-electric-sports-car.jpg',


  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text(
                'See all',
                style: TextStyle(
                color: GlobalVariables.unselectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10,top: 20,right: 0,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context,index){
              return SingleProduct(
                image: list[index],
              );
          },
          ),
        ),
      ],
    );
  }
}
