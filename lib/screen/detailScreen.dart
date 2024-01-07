import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            InkWell(
              onTap: () {

             },
              child: Container(
                padding: EdgeInsets.all(10),
                child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.network('${data!.image}',height: 200,width: double.infinity,fit: BoxFit.cover,),
                        ),
                        // Container(
                        //   // width: 230,
                        //   margin: EdgeInsets.only(top: 5,bottom: 5),
                        //   child: Text(' ${data!.image}',
                        //     maxLines: 3,
                        //     style: TextStyle(color: ColorDark.collegeText,fontWeight: FontWeight.w500,fontSize: textSizeLargeMedium),),
                        // ),

                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 5,bottom: 5),
                          child: Text("QR Code${data!.qRCode}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.collegeText,fontSize: textSizeMedium)),
                        ),
                        SizedBox(height: 5,),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Price -",style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: Text('${data!.mRP}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
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
                                child: Text('Exchange -',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: Text('${data!.option}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: textSizeSMedium)),
                              )
                            ],
                          ),
                        )
                      ],
                    )

              ),
            ),
            SizedBox(height: 10,),
            Obx(()=>
                GridView.builder(
                  padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    shrinkWrap: true,

                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.sameDataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.network(controller.sameDataList.elementAt(index).image!,height: 50,width: double.infinity,fit: BoxFit.cover,),
                            ),
                            //SizedBox(height: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("QrCode: ${controller.sameDataList.elementAt(index).qRCode.toString()}",style: TextStyle(fontWeight: FontWeight.w700),),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("OP:  ${controller.sameDataList.elementAt(index).option.toString()}",style: TextStyle(fontWeight: FontWeight.w700),),
                                ],
                              ),
                            ),
                            // SizedBox(height: 5,),
                            // Row(
                            //  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //
                            //     Container(
                            //       child: Text("MRP: ${data!.mRP.toString()}",style: TextStyle(fontWeight: FontWeight.w700),),
                            //     ),
                            //     Container(
                            //       child: Text("SubCategory: ${data!.subCategory.toString()}",style: TextStyle(fontWeight: FontWeight.w700),),
                            //     ),
                            //
                            //   ],
                            // ),
                            // SizedBox(height: 5,),

                          ],
                        ) ,
                      );
                    })
            
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