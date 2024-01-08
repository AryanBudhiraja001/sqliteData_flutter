
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
    var users = await _productServices.readAllData();
    users.forEach((json) {
    if(json['SubCategory']!=null){
      if(json['SubCategory'].toString().contains(products!.subCategory.toString())){
        if(json['SubCategory'].toString().contains(products!.qRCode.toString())){

        }else{
          sameDataList.add(Products(
              mRP :json['MRP'],
            color : json['color'],
            option :json['Option'],
            qRCode : json['QRCode'],
            image : json['ImageUrl'],
            subCategory : json['SubCategory'],
            season : json['Season'],
            brand : json['Brand'],
            mood : json['Mood'],
            gender : json['Gender'],
            theme : json['Theme'],
            category : json['Category'],
            name : json['Name'],
            collection :json['Collection'],
            fit : json['Fit'],
            description : json['Description'],
            finish : json['finish'],




          ));
        }
        //print("sub ${user['SubCategory'].toString()}");
        //print("sub ${user['Option'].toString()}");


      }
    }

      //print("user  ${user['ImageUrl']}");
      //dataList.add(Products(image:user['ImageUrl'],option:user['Option'],qRCode: user['QRCode'],mRP: user['MRP'],subCategory:user['subCategory']));
    });
   // Get.to(()=> DetailScreen(data: products,));
    print("Same data ${sameDataList.length}");
  }
}