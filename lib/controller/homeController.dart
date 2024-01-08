

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

/// Brand, Category, SubCategory, Collection, Fit, Theme, Finish, Offer Month, Gender, Name, Description
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
        tenDataList.add(Products(
            image:loginResponse.products![i].image,
            option:loginResponse.products![i].option,
            qRCode: loginResponse.products![i].qRCode,
            mRP: loginResponse.products![i].mRP,
            subCategory:loginResponse.products![i].subCategory,

            brand: loginResponse.products![i].brand,
            category: loginResponse.products![i].category,
            season: loginResponse.products![i].season,
            gender:loginResponse.products![i].gender,
            mood: loginResponse.products![i].mood,
            theme:loginResponse.products![i].theme,
            color: loginResponse.products![i].color,
            name:loginResponse.products![i].name,
            collection:loginResponse.products![i].collection,
            fit:loginResponse.products![i].fit,
            description:loginResponse.products![i].description,
            finish:loginResponse.products![i].finish



        ));


        //_productServices.insertData(Products(image:loginResponse.products![i].image,option:loginResponse.products![i].option,qRCode: loginResponse.products![i].qRCode,mRP: loginResponse.products![i].mRP));
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
    print("get All Data");
    var users = await _productServices.readAllData();

    print("usersList   ${users.length}");
    users.forEach((json) {

      print("subcategory getAllData ${json['SubCategory']}");
      print('get all Option ${json['Option']}');
      dataList.add(Products(
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
    });

    update();
  }


  searchData(text)async{
    dataList.clear();
    var searchList = await _productServices.readDataThroughId(text);
    print("Search  ${searchList}");
    searchList.forEach((json) {
      print("user  ${json['Option']}");
      dataList.add(Products(
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
    });
  }



  
}