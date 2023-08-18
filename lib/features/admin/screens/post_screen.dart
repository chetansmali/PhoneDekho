import 'package:flutter/material.dart';
import 'package:phonedekho/common/widget/loder.dart';
import 'package:phonedekho/features/account/widgets/single_product.dart';
import 'package:phonedekho/features/admin/screens/add_product_screen.dart';
import 'package:phonedekho/features/admin/services/admin_services.dart';
import 'package:phonedekho/models/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final AdminServices adminServices=AdminServices();
  List<Product>? porducts;

  void initState(){
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async{
    porducts = await adminServices.fetchAllProducts(context);
    setState(() {

    });
  }

  void deleteProduct(Product product,int index){
    adminServices.deleteProduct(context: context, product: product, onSuccess: (){
      porducts!.removeAt(index);
      setState(() {});
    });
  }

  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return porducts == null ? const Loader()
    : Scaffold(
      body: GridView.builder(
        itemCount: porducts!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            final productData = porducts![index];
            return Column(
              children: [
                SizedBox(height: 140,
                child: SingleProduct(
                  image: productData.images[0],
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Text(
                      productData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    ),
                    IconButton(onPressed: () => {
                      deleteProduct(productData, index)
                    }, icon: Icon(Icons.delete_outline),
                    ),
                  ],
                )
              ],
            );
          }),

      floatingActionButton:   FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: navigateToAddProduct,
        tooltip: "Add a Product",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
