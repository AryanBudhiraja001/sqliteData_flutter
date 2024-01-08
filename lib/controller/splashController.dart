

import 'dart:convert';

import 'package:search_task/core/authManager.dart';
import 'package:search_task/model/dashboadModel.dart';
import 'package:search_task/screen/homeScreen.dart';
import 'package:search_task/screen/loginScreen.dart';
import 'package:get/get.dart';
import 'package:search_task/services/database/db_Service.dart';
import 'package:search_task/services/repo/common_repo.dart';

class SplashController extends GetxController{
  AuthenticationManager  authenticationManager = Get.put(AuthenticationManager());
  final _productServices = ProductService();
  List tenDataList =<Products>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    clearUserTable();
    homeFunction();
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(()=> HomeScreen());
      ///authenticationManager.checkLoginStatus();
    });
  }
  // async{
  // var search = await _productServices.readDataThroughId(text);

  clearUserTable()async{
    await _productServices.deletedData();
  }

  // static const Brand = 'Brand';
  // static const Category = 'Category';
  // static const subCategory = 'SubCategory';
  // static const Collection = 'Collection';
  // static const Description = 'Description';
  // static const Gender = 'Gender';
  // static const Theme = 'Theme';
  // static const Name = 'Name';
  // static const Color = 'Color';
  // static const Fit = 'Fit';
  // static const Season = 'Season';
  // static const Finish = 'Finish';

  homeFunction() async {
    var loginResponse = await ApiController().listingData();
    print("json "+jsonEncode(loginResponse));
    if (loginResponse.productCount==652) {
      for(int i=0; i<loginResponse.products!.length;i++){
        tenDataList.add(Products(image:loginResponse.products![i].image,
          option:loginResponse.products![i].option,
          qRCode: loginResponse.products![i].qRCode,
          mRP: loginResponse.products![i].mRP,

          season: loginResponse.products![i].season,
          subCategory: loginResponse.products![i].subCategory,
          collection: loginResponse.products![i].collection,
          brand:  loginResponse.products![i].brand,
          description: loginResponse.products![i].description,
          gender:  loginResponse.products![i].gender,
          theme: loginResponse.products![i].theme,
          name: loginResponse.products![i].name,
          color:loginResponse.products![i].color,
          fit: loginResponse.products![i].fit,
          finish: loginResponse.products![i].finish,
            mood:loginResponse.products![i].mood
        ));
        //  _productServices.insertData(Products(image:loginResponse.products![i].image,option:loginResponse.products![i].option,qRCode: loginResponse.products![i].qRCode,mRP: loginResponse.products![i].mRP));
        // dataList.add(Products(image:loginResponse.products![i].image,option:loginResponse.products![i].option,qRCode: loginResponse.products![i].qRCode,mRP: loginResponse.products![i].mRP));
      }
    }
    localDataSave();
    update();
  }

  localDataSave(){
    for (var list in tenDataList) {
      _productServices.insertData(list);
    }
  }



}