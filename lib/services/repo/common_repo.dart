
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:search_task/model/dashboadModel.dart';
import 'package:search_task/model/splashModel.dart';
import 'package:search_task/services/api/api_endpoint.dart';
import 'package:search_task/services/api/api_hitter.dart';
import 'package:search_task/services/base/base_repository.dart';


class ApiController extends BaseRepository {

  Future<LoginModel> loginUser(String username,String password) async {
    var formData = FormData.fromMap({
      'email':'${username}',
      'password':'${password}'
    });
    print('url ${ApiEndpoint.loginUrl}');
   // print('data ${json.encode(formData)}');

    ApiResponse? apiResponse = await apiHitter.getRawPostApiResponse(ApiEndpoint.loginUrl, formData:formData);
    {
      try {

        if (apiResponse!.responseCode == 200) {
          print("jsonresponse");

          return LoginModel.fromJson(apiResponse.response.data);
        } else {
          if (apiResponse.responseCode == 201) {
            return LoginModel.fromJson(json.decode(apiResponse.response));
          } else {
            return LoginModel.fromJson(json.decode(apiResponse.response));
          }
        }
      } catch (error) {
        return LoginModel();
      }
    }
  }




  Future<DashBoardModel> listingData() async {

    ApiResponse? apiResponse = await apiHitter.getApiResponse(ApiEndpoint.homeUrl,

    );
    {
      try {

        if (apiResponse!.responseCode == 200) {
          print("programListing");
          print(jsonEncode(apiResponse.response.data));
          return DashBoardModel.fromJson(apiResponse.response.data);
        } else {
          if (apiResponse.responseCode == 201) {
            return DashBoardModel.fromJson(apiResponse.response.data);
          } else {
            return DashBoardModel.fromJson(apiResponse.response.data);
          }
        }
      } catch (error) {
        return DashBoardModel();
      }
    }
  }

 // Future<DashBoardModel?> listingData() async {
 //    print('url ${ApiEndpoint.homeUrl}');
 //    /// print('data ${json.encode(formData)}');
 //    ApiResponse? apiResponse = await apiHitter.getApiResponse(ApiEndpoint.homeUrl);
 //    {
 //      try {
 //
 //        if (apiResponse!.responseCode == 200) {
 //          print("jsonresponse");
 //
 //          return DashBoardModel.fromJson(jsonDecode(apiResponse.response.data));
 //        } else {
 //          if (apiResponse.responseCode == 201) {
 //            return DashBoardModel.fromJson(jsonDecode(apiResponse.response.data));
 //          } else {
 //            return DashBoardModel.fromJson(jsonDecode(apiResponse.response.data));
 //          }
 //        }
 //      } catch (error) {
 //        DashBoardModel.fromJson({});
 //      }
 //    }
 //  }









}