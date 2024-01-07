

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:search_task/core/authManager.dart';
import 'package:search_task/extras/constant/common_laoder.dart';
import 'package:search_task/model/dashboadModel.dart';
import 'package:search_task/screen/detailScreen.dart';
import 'package:search_task/services/database/db_Service.dart';
import 'package:search_task/services/repo/common_repo.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {

  AuthenticationManager manager = Get.put(AuthenticationManager());
  final scrollController = ScrollController();
  int i=0;
  int j=10;
  List dataList = <Products>[].obs;
  List tenDataList = <Products>[].obs;

  var isLoading = false.obs;
  var response;
  var firstLoading = false.obs;
  final _productServices = ProductService();
  var text = TextEditingController();




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
   // homeFunction();
  //  scrollController.addListener(_loadMore);
  }










  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  dataUpdate(){
    clearUserTable();
    Future.delayed(const Duration(seconds: 2),(){
      homeFunction();
    });

  }

  clearUserTable()async{
    await _productServices.deletedData();
  }


  homeFunction() async {
    firstLoading.value = true;
    var loginResponse = await ApiController().listingData();
    print("json "+jsonEncode(loginResponse));
    if (loginResponse.productCount==652) {
      for(int i=0; i<loginResponse.products!.length;i++){
        print('subcategory home function ${loginResponse.products![i].subCategory}');
        tenDataList.add(Products(image:loginResponse.products![i].image,option:loginResponse.products![i].option,qRCode: loginResponse.products![i].qRCode,mRP: loginResponse.products![i].mRP,subCategory:loginResponse.products![i].subCategory));
      //  _productServices.insertData(Products(image:loginResponse.products![i].image,option:loginResponse.products![i].option,qRCode: loginResponse.products![i].qRCode,mRP: loginResponse.products![i].mRP));
        // dataList.add(Products(image:loginResponse.products![i].image,option:loginResponse.products![i].option,qRCode: loginResponse.products![i].qRCode,mRP: loginResponse.products![i].mRP));
      }

      // dataList.addAll(loginResponse.products!);
      //tenDataList.addAll(dataList.sublist(i,j));
     // print("length   ${dataList.length}");
      firstLoading.value = false;
    }
    localDataSave();
    update();
  }

  localDataSave(){
    for (var list in tenDataList) {

      _productServices.insertData(list);
    }
  }


  getAllData() async {
    var users = await _productServices.readAllData();
    users.forEach((user) {

      print("subcategory getAllData ${user['SubCategory']}");
      print('get all Option ${user['Option']}');
      dataList.add(Products(image:user['ImageUrl'],option:user['Option'],qRCode: user['QRCode'],mRP: user['MRP'],subCategory:user['SubCategory']));
    });

    update();
  }


  searchData(text)async{
    dataList.clear();
    var searchList = await _productServices.readDataThroughId(text);
    print("Search  ${searchList}");
    searchList.forEach((user) {
      print("user  ${user['Option']}");
      dataList.add(Products(image:user['ImageUrl'],option:user['Option'],qRCode: user['QRCode'],mRP: user['MRP'],subCategory:user['subCategory'] ));
    });
  }



  
}