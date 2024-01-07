

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
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(()=> HomeScreen());
      ///authenticationManager.checkLoginStatus();
    });
  }
  // async{
  // var search = await _productServices.readDataThroughId(text);

  clearUserTable()async{
    await _productServices.deletedData();
  }



  homeFunction() async {
    var loginResponse = await ApiController().listingData();
    print("json "+jsonEncode(loginResponse));
    if (loginResponse.productCount==652) {
      for(int i=0; i<loginResponse.products!.length;i++){
        tenDataList.add(Products(image:loginResponse.products![i].image,option:loginResponse.products![i].option,qRCode: loginResponse.products![i].qRCode,mRP: loginResponse.products![i].mRP,subCategory: loginResponse.products![i].subCategory));
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