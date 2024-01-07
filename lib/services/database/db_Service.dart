
import 'package:search_task/services/database/db_helper.dart';
import 'package:search_task/services/database/table_name.dart';
import 'package:search_task/model/dashboadModel.dart';
import 'package:search_task/services/database/db_repository.dart';

class ProductService {
  late DbRepository _repository;

  ProductService() {
    _repository = DbRepository();
  }

  //Save User
  // insertData(Products modelData) async {
  //   return await _repository.insertData(TableName.product, modelData.toJson());
  // }

  Future<void> insertData(Products dog) async {

    await _repository.insertData(TableName.product, dog.toJson(),);
  }
  // insertAllData(Products modelData)async{
  //  await DatabaseHelper.insertDataList(modelData.toJson());
  // }



  //Read All category
  readAllData() async {
    return await _repository.readData(TableName.product);
  }



  readDataThroughId(itemId) async {
    return await _repository.readDataByProductName(TableName.product, itemId);
  }


  deletedData()async{
    return await _repository.deleteAllData(TableName.product);
  }

  //Edit User
  // updateData(ProductModel modelData) async {
  //   return await _repository.updateData(
  //       TableName.product, modelData.productMap());
  // }



  // readAllGROUPCategoryData() async {
  //   return await _repository.readDistinctProductFORASTBData(TableName.product);
  // }
  //
  //
  // deleteData(id) async {
  //   return await _repository.deleteDataByProductName(TableName.product, id);
  // }
  //
  // deleteThroughIdData(id) async {
  //   return await _repository.deleteDataById(TableName.product, id);
  // }


}
