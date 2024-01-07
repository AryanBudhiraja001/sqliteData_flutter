
import 'package:get/get.dart';
import 'package:search_task/model/dashboadModel.dart';
import 'package:search_task/services/database/db_Service.dart';

class DetailController extends GetxController{

  final _productServices = ProductService();
  List sameDataList = <Products>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }



  sameBrand(Products products)async {

    sameDataList.clear();
    // print("subCategory ${products.subCategory}");
    // print("subCategory ${products.subCategory}");
    var users = await _productServices.readAllData();
    users.forEach((user) {
    if(user['SubCategory']!=null){
      if(user['SubCategory'].toString().contains(products!.subCategory.toString())){
        print("sub ${user['SubCategory'].toString()}");
        print("sub ${user['Option'].toString()}");
        sameDataList.add(Products(image:user['ImageUrl'],option:user['Option'],qRCode: user['QRCode'],mRP: user['MRP'],subCategory:user['SubCategory'] ));
      }
    }

      //print("user  ${user['ImageUrl']}");
      //dataList.add(Products(image:user['ImageUrl'],option:user['Option'],qRCode: user['QRCode'],mRP: user['MRP'],subCategory:user['subCategory']));
    });
   // Get.to(()=> DetailScreen(data: products,));
    print("Same data ${sameDataList.length}");
  }
}