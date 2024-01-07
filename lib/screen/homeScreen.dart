import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_task/controller/homeController.dart';
import 'package:search_task/extras/constant/app_constant.dart';
import 'package:search_task/extras/constant/app_images.dart';
import 'package:search_task/screen/detailScreen.dart';
import 'package:search_task/themes/colors/color_dark.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   var homeController = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(()=> Column(
          children: [
            Container(

              height: 120,
              padding: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                color: ColorDark.activeColor,
              ),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                      ),
                    ),
                    Spacer(),

                    /// Heigth remove in container

                    Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 20),
                      child: Text("HomeScreen",textAlign: TextAlign.center,style: TextStyle(color: ColorDark.white,fontSize: textSizeNormal,fontWeight: FontWeight.w700),),
                    ),

                    Spacer(),



                    InkWell(
                      onTap: (){
                        homeController.dataUpdate();
                       /// homeController.getAllData();
                        ///showAlertDialog(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImageConstant.imgSync,color: Colors.white,
                          height: 30,
                          width: 30, fit: BoxFit.fill,

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Visibility(
              visible: homeController.firstLoading.value,
              child: Container(
                   margin: EdgeInsets.only(top: Get.height*0.4),
                   child: Text("loading...",style: TextStyle(fontSize: textSizeLarge),),
                 ),
            ),

            Visibility(
              visible: homeController.firstLoading.value==false,
              child: Container(
                child:   homeController.dataList!=null?
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon:  Icon(Icons.search,color: ColorDark.black,),
                            filled: true,
                            fillColor: ColorDark.cardColor,
                            focusColor: ColorDark.cardColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: ColorDark.cardColor, width: 2.0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: ColorDark.cardColor, width: 2.0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: ColorDark.cardColor, width: 2.0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: ColorDark.black,),
                          ),
                          onChanged: (text){
                            homeController.searchData(text);
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: Get.height*0.8,
                        width: double.infinity,
                        child:
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: homeController.dataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (){
                               Get.to(()=> DetailScreen(data: homeController.dataList[index]));
                                // homeController.sameBrand(homeController.dataList.elementAt(index));
                                /// await homeController.showNotification(title: homeController.dataList[index]['name'],body: homeController.dataList[index]['exchange']);

                              },
                              child: Card(
                                color: ColorDark.white,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      // SizedBox(width: 20),
                                      Container(
                                        child: Image.network(homeController.dataList.elementAt(index).image,height: 100,width: 100,fit: BoxFit.cover,),
                                      ),


                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Container(
                                                // width: 230,
                                                margin: EdgeInsets.only(top: 5,bottom: 5),
                                                child: Text('OP: ${homeController.dataList.elementAt(index).option}',
                                                  maxLines: 3,
                                                  style: TextStyle(color: ColorDark.collegeText,fontWeight: FontWeight.w500,fontSize: textSizeSmall),),
                                              ),

                                              // Container(
                                              //   margin: EdgeInsets.only(top: 5,bottom: 5),
                                              //   child: Text("${homeController.dataList.elementAt(index).option}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.collegeText,fontSize: textSizeSmallest)),
                                              // ),
                                              // SizedBox(height: 5,),

                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Text("QRCode -",style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.collegeText,fontSize: textSizeSmallest)),
                                                    ),
                                                    SizedBox(width: 20,),
                                                    Container(
                                                      child: Text('${homeController.dataList.elementAt(index).qRCode}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.collegeText,fontSize: textSizeSmallest)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Text('MRP -',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.black,fontSize: sizeSmall)),
                                                    ),
                                                    SizedBox(width: 20,),
                                                    Container(
                                                      child: Text('\u{20B9}${homeController.dataList.elementAt(index).mRP}',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.black,fontSize: sizeSmall)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Text('SubCategory -',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.black,fontSize: sizeSmall)),
                                                    ),
                                                    SizedBox(width: 20,),
                                                    Container(
                                                      child: Text('${homeController.dataList.elementAt(index).subCategory}',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.black,fontSize: sizeSmall)),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                      ),

                                      Spacer(),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                      ),

                      Visibility(
                        visible: homeController.isLoading.value,
                        child: Container(child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  ),
                ):SizedBox(),
              ),
            ),



          ],
        ),),
      ),
    );
  }



   showAlertDialog(BuildContext context) {
     Widget okButton = TextButton(
       child: Text("Yes"),
       onPressed: () {
         homeController.manager.logOut();
       },
     );
     Widget noButton = TextButton(
       child: Text("No"),
       onPressed: () {
         Get.back();
         // dashboardData.manager.logOut();
       },
     );
     // set up the AlertDialog
     AlertDialog alert = AlertDialog(
       content: Text("Are you sure you want to logout?"),
       actions: [
         okButton,
         noButton,

       ],
     );


     showDialog(
       context: context,
       builder: (BuildContext context) {
         return alert;
       },
     );
   }
}
