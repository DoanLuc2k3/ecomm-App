import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/screens/user-panel/product-details-screen.dart';
import 'package:e_comm/screens/user-panel/single-category-products-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../../models/categories-model.dart';
import '../../models/product-model.dart';
import '../../utils/app-constant.dart';
class AllFlashSaleProductScreen extends StatefulWidget {
  const AllFlashSaleProductScreen({super.key});

  @override
  State<AllFlashSaleProductScreen> createState() => _AllFlashSaleProductScreenState();
}

class _AllFlashSaleProductScreenState extends State<AllFlashSaleProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppConstant.appTextColor,
        ),
        backgroundColor: AppConstant.appScendoryColor,
        title: Text("Tất cả sản phẩm FlashSale",
          style: TextStyle(color: AppConstant.appTextColor) ,
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('products')
            .where('isSale', isEqualTo: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("error"),
            );
          }
          if(snapshot.connectionState== ConnectionState.waiting){
            return Container(
              height: Get.height /8,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if(snapshot.data!.docs.isEmpty){
            return Center(child: Text("No products found!"),
            );
          }
          if(snapshot.data != null){
            return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.19,),
                itemBuilder: (context,index){
                  final productData = snapshot.data!.docs[index];
                  ProductModel productModel = ProductModel(
                      productId: productData['productId'],
                      categoryId: productData['categoryId'],
                      productName: productData['productName'],
                      categoryName: productData['categoryName'],
                      salePrice: productData['salePrice'],
                      fullPrice: productData['fullPrice'],
                      productImages: productData['productImages'],
                      deliveryTime: productData['deliveryTime'],
                      isSale: productData['isSale'],
                      productDescription: productData['productDescription'],
                      createdAt: productData['createdAt'],
                      updatedAt: productData['updatedAt']
                  );
                  // CategoriesModel categoriesModel= CategoriesModel(
                  //   categoryId: snapshot.data!.docs[index]['categoryId'],
                  //   categoryName: snapshot.data!.docs[index]['categoryName'],
                  //   categoryImg: snapshot.data!.docs[index]['categoryImg'],
                  //   createdAt: snapshot.data!.docs[index]['createdAt'],
                  //   updatedAt: snapshot.data!.docs[index]['updatedAt'],
                  // );
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(()=>
                        ProductDetailsScreen(productModel: productModel)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width/2.3,
                              heightImage: Get.height/10,
                              imageProvider: CachedNetworkImageProvider(
                                productModel.productImages[0],
                              ),
                              title: Center(
                                child: Text(productModel.productName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),

                            ),
                          ),
                        )  ,
                      ),
                    ],
                  );
                }
            );

            //   Container(
            //   height: Get.height/5,
            //   child: ListView.builder(
            //       itemCount: snapshot.data!.docs.length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //
            //   ),
            // );
          }
          return Container();
        },
      ),
    );
  }
}
