import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:search_task/controller/detailController.dart';

import 'package:search_task/controller/homeController.dart';
import 'package:search_task/extras/constant/app_constant.dart';
import 'package:search_task/model/dashboadModel.dart';
import 'package:search_task/themes/colors/color_dark.dart';
import 'package:get/get.dart';
//int id = 0;


class DetailScreen extends StatelessWidget {
  //var controller = Get.find<HomeController>();

  var controller = Get.put(DetailController());
  Products? data;
  DetailScreen({super.key,this.data});



  @override
  Widget build(BuildContext context) {
    controller.sameBrand(data!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorDark.activeColor,
        centerTitle: true,
        title:  Text("Detail Screen",textAlign: TextAlign.center,style: TextStyle(color: ColorDark.white,fontSize: textSizeNormal,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: Image.network('${data!.image}',height: 200,width: double.infinity,fit: BoxFit.cover,),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                       // margin: EdgeInsets.only(top: 5,bottom: 5),
                        child: Row(
                          children: [
                            Text("Brand Name :",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.blueColor,fontSize: textSizeNormal)),

                            Text("${data!.brand}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeMedium)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 5,bottom: 5),
                            child: Row(
                              children: [
                                Text("Color :",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.blueColor,fontSize: textSizeNormal)),
                                Text("${data!.color}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeMedium)),
                              ],
                            ),
                          ),
                          Container(
                            child: Text('Price \u{20B9} ${data!.mRP}',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.black,fontSize: textSizeSMedium)),
                          )

                        ],
                      ),
                      SizedBox(height: 5,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('OP -',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.blueColor,fontSize: textSizeNormal)),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              child: Text('${data!.option}',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),
                      )
                    ],
                  )

            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              //alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: textSizeNormal),),
                  SizedBox(height: 30,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Brand Name',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text('${data!.brand}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text("Category",style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text('${data!.category}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 2.0,),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Description',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),

                            Container(
                              child: Text('${data!.description}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text("Sub-Category",style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),

                            Container(
                              child: Text('${data!.subCategory}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 2.0,),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Fit',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text('${data!.fit}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text("Name",style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text('${data!.name}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 2.0,),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Finish',style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text('${data!.finish}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text("Gender",style: TextStyle(fontWeight: FontWeight.w700,color: ColorDark.blueColor,fontSize: textSizeSMedium)),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text('${data!.gender}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                            )
                          ],
                        ),
                      ],
                    ),
                  )

                ],
              ),

            ),


            SizedBox(height: 10,),

            Container(
                alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10),
              child: Text("Similar Products",style: TextStyle(fontWeight: FontWeight.w600,fontSize: textSizeNormal),),
            ),

            SizedBox(height: 10,),
            Container(
              height: 300,
              child: Obx(()=>
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.sameDataList.toSet().length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(

                                child: Image.network(controller.sameDataList.elementAt(index).image!,height: 100,width: 100,fit: BoxFit.cover,),
                              ),
                              //SizedBox(height: 10,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text("${controller.sameDataList.elementAt(index).brand.toString()}",style: TextStyle(fontWeight: FontWeight.w700),),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("OP:  ${controller.sameDataList.elementAt(index).option.toString()}",style: TextStyle(fontWeight: FontWeight.w700),),
                                  ],
                                ),
                              ),
                            ],
                          ) ,
                        );
                      })

              ),
            )


          ],
        ),
      ),
    );
  }
}
































//
//
//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// @override
// void initState() {
//   super.initState();
//   _isAndroidPermissionGranted();
//   _requestPermissions();
//
// }
//
//
//
//
// Future<void> _showNotification({String? title,String? body}) async {
//   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       'your channel id', 'your channel name',
//       channelDescription: 'your channel description',
//       icon: '@mipmap/ic_launcher',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker');
//   const NotificationDetails notificationDetails =
//   NotificationDetails(android: androidNotificationDetails );
//   await flutterLocalNotificationsPlugin.show(0, '${title}', '${body}', notificationDetails, payload: 'item x');
// }
//
//
//
//
//
// Future<void> _isAndroidPermissionGranted() async {
//   if (Platform.isAndroid) {
//     final bool granted = await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.areNotificationsEnabled() ??
//         false;
//
//
//   }
// }
//
// Future<void> _requestPermissions() async {
//   if (Platform.isIOS || Platform.isMacOS) {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   } else if (Platform.isAndroid) {
//     final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//
//     final bool? grantedNotificationPermission =
//     await androidImplementation?.requestNotificationsPermission();
//
//   }
// }