import 'package:flutter/material.dart';
import 'package:phonedekho/common/widget/loder.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:phonedekho/features/home/services/home_services.dart';
import 'package:phonedekho/models/product.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
List<Product>? productList;
HomeService homeService=HomeService();
  @override
  void initState(){
    super.initState();
    fetchCategoryProduct();
  }

  fetchCategoryProduct() async{
    productList = await homeService.fetchCategoryProduct(context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Text(
              widget.category,
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: productList == null
          ? const Loader()
          : Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Keep shoping for ${widget.category}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding:  const EdgeInsets.only(left: 15),
              itemCount: productList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                final product = productList![index];
                  return Column(
                    children: [
                      SizedBox(height: 130,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 0.5
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(product.images[0]),
                        ),
                      ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 0,right: 15,top: 0),
                        child: Text(product.name,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
