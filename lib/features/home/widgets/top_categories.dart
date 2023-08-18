import 'package:flutter/material.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:phonedekho/features/home/screens/category_deals_screen.dart';

class TopCaegories extends StatelessWidget {
  const TopCaegories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category){
    Navigator.pushNamed(context, CategoryDealsScreen.routeName, arguments: category);
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemExtent: 75,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: () => navigateToCategoryPage(context, GlobalVariables.categoryImages[index]['title']!),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                          GlobalVariables.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(GlobalVariables.categoryImages[index]['title']!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                ],
              ),
            );
          }
          ),
    );
  }
}
