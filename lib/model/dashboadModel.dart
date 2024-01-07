class DashBoardModel {
  var productCount;
  List<Products>? products;
  List<Brands>? brands;
  var lastUpdatedToken;
  var appColor;

  DashBoardModel({this.productCount, this.products, this.brands, this.lastUpdatedToken, this.appColor});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    productCount = json['ProductCount'];
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) { products!.add(new Products.fromJson(v)); });
    }
    if (json['Brands'] != null) {
      brands = <Brands>[];
      json['Brands'].forEach((v) { brands!.add(new Brands.fromJson(v)); });
    }
    lastUpdatedToken = json['LastUpdatedToken'];
    appColor = json['AppColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductCount'] = this.productCount;
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['Brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    data['LastUpdatedToken'] = this.lastUpdatedToken;
    data['AppColor'] = this.appColor;
    return data;
  }
}

class Products {
  String? image;
  String? qRCode;
  var mRP;
  String? option;
  var subCategory;
  //
  // String? season;
  // String? brand;
  // String? mood;
  // String? gender;
  // String? theme;
  // String? category;
  // String? name;
  // String? color;
  //
  //
  // String? subCategory;
  // String? collection;
  // String? fit;
  // String? description;
  //
  // String? looks;
  // var looksImageUrl;
  // var looksImage;
  // String? fabric;
  // EAN? eAN;
  // String? finish;
  // List<String>? availableSizes;
  // List<AvailableSizesWithDeactivated>? availableSizesWithDeactivated;
  // List<String>? offerMonths;
  // var productClass;
  // bool? promoted;
  // bool? secondary;
  // bool? deactivated;
  // var defaultSize;
  // String? material;
  // String? quality;
  // String? qRCode2;
  // String? displayName;
  // var displayOrder;
  // var minQuantity;
  // var maxQuantity;
  // String? qPSCode;
  // var demandType;
  //
  // String? imageUrl;
  // String? imageUrl2;
  // String? imageUrl3;
  // String? imageUrl4;
  // String? imageUrl5;
  // var imageUrl6;
  // var imageUrl7;
  // var imageUrl8;
  // var imageUrl9;
  // var imageUrl10;
  // var imageUrl11;
  // var imageUrl12;
  // bool? adShoot;
  // String? technology;
  // String? imageAlt;
  // var technologyImage;
  // String? technologyImageUrl;
  // bool? isCore;
  // var minimumArticleQuantity;
  // var likeabilty;
  // String? brandRank;
  // List? gradeToRatiosApps;
  // List? relatedProducts;

  //Products({this.season, this.brand, this.mood, this.gender, this.theme, this.category, this.name, this.color, this.option, this.mRP, this.subCategory, this.collection, this.fit, this.description, this.qRCode, this.looks, this.looksImageUrl, this.looksImage, this.fabric, this.eAN, this.finish, this.availableSizes, this.availableSizesWithDeactivated, this.offerMonths, this.productClass, this.promoted, this.secondary, this.deactivated, this.defaultSize, this.material, this.quality, this.qRCode2, this.displayName, this.displayOrder, this.minQuantity, this.maxQuantity, this.qPSCode, this.demandType, this.image, this.imageUrl, this.imageUrl2, this.imageUrl3, this.imageUrl4, this.imageUrl5, this.imageUrl6, this.imageUrl7, this.imageUrl8, this.imageUrl9, this.imageUrl10, this.imageUrl11, this.imageUrl12, this.adShoot, this.technology, this.imageAlt, this.technologyImage, this.technologyImageUrl, this.isCore, this.minimumArticleQuantity, this.likeabilty, this.brandRank, this.gradeToRatiosApps, this.relatedProducts});
  Products({this.image,this.option,this.mRP,this.qRCode,this.subCategory});

  Products.fromJson(Map<String, dynamic> json) {
    mRP = json['MRP'];
    option = json['Option'];
    qRCode = json['QRCode'];
    image = json['ImageUrl'];
    subCategory = json['SubCategory'];


    // season = json['Season'];
    // brand = json['Brand'];
    // mood = json['Mood'];
    // gender = json['Gender'];
    // theme = json['Theme'];
    // category = json['Category'];
    // name = json['Name'];
    // color = json['Color'];
    // option = json['Option'];
    // mRP = json['MRP'];
    // subCategory = json['SubCategory'];
    // collection = json['Collection'];
    // fit = json['Fit'];
    // description = json['Description'];
    // qRCode = json['QRCode'];
    // looks = json['Looks'];
    // looksImageUrl = json['LooksImageUrl'];
    // looksImage = json['LooksImage'];
    // fabric = json['Fabric'];
    // eAN = json['EAN'] != null ? new EAN.fromJson(json['EAN']) : null;
    // finish = json['Finish'];
    // availableSizes = json['AvailableSizes'].cast<String>();
    // if (json['AvailableSizesWithDeactivated'] != null) {
    //   availableSizesWithDeactivated = <AvailableSizesWithDeactivated>[];
    //   json['AvailableSizesWithDeactivated'].forEach((v) { availableSizesWithDeactivated!.add(new AvailableSizesWithDeactivated.fromJson(v)); });
    // }
    // //sizeWiseStock = json['SizeWiseStock'] != null ? new SizeWiseStock.fromJson(json['SizeWiseStock']) : null;
    // //sizeWiseStockPlant = json['SizeWiseStockPlant'] != null ? new SizeWiseStock.fromJson(json['SizeWiseStockPlant']) : null;
    // offerMonths = json['OfferMonths'].cast<String>();
    // productClass = json['ProductClass'];
    // promoted = json['Promoted'];
    // secondary = json['Secondary'];
    // deactivated = json['Deactivated'];
    // defaultSize = json['DefaultSize'];
    // material = json['Material'];
    // quality = json['Quality'];
    // qRCode2 = json['QRCode2'];
    // displayName = json['DisplayName'];
    // displayOrder = json['DisplayOrder'];
    // minQuantity = json['MinQuantity'];
    // maxQuantity = json['MaxQuantity'];
    // qPSCode = json['QPSCode'];
    // demandType = json['DemandType'];
    // image = json['Image'];
    // imageUrl = json['ImageUrl'];
    // imageUrl2 = json['ImageUrl2'];
    // imageUrl3 = json['ImageUrl3'];
    // imageUrl4 = json['ImageUrl4'];
    // imageUrl5 = json['ImageUrl5'];
    // imageUrl6 = json['ImageUrl6'];
    // imageUrl7 = json['ImageUrl7'];
    // imageUrl8 = json['ImageUrl8'];
    // imageUrl9 = json['ImageUrl9'];
    // imageUrl10 = json['ImageUrl10'];
    // imageUrl11 = json['ImageUrl11'];
    // imageUrl12 = json['ImageUrl12'];
    // adShoot = json['AdShoot'];
    // technology = json['Technology'];
    // imageAlt = json['ImageAlt'];
    // technologyImage = json['TechnologyImage'];
    // technologyImageUrl = json['TechnologyImageUrl'];
    // isCore = json['IsCore'];
    // minimumArticleQuantity = json['MinimumArticleQuantity'];
    // likeabilty = json['Likeabilty'];
    // brandRank = json['BrandRank'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MRP'] = this.mRP;
    data['ImageUrl'] = this.image;
    data['Option'] = this.option;
    data['QRCode'] = this.qRCode;
    data['SubCategory']= this.subCategory;




    // data['Season'] = this.season;
    // data['Brand'] = this.brand;
    // data['Mood'] = this.mood;
    // data['Gender'] = this.gender;
    // data['Theme'] = this.theme;
    // data['Category'] = this.category;
    // data['Name'] = this.name;
    // data['Color'] = this.color;
    // data['Option'] = this.option;
    // data['MRP'] = this.mRP;
    // data['SubCategory'] = this.subCategory;
    // data['Collection'] = this.collection;
    // data['Fit'] = this.fit;
    // data['Description'] = this.description;
    // data['QRCode'] = this.qRCode;
    // data['Looks'] = this.looks;
    // data['LooksImageUrl'] = this.looksImageUrl;
    // data['LooksImage'] = this.looksImage;
    // data['Fabric'] = this.fabric;
    // if (this.eAN != null) {
    //   data['EAN'] = this.eAN!.toJson();
    // }
    // data['Finish'] = this.finish;
    // data['AvailableSizes'] = this.availableSizes;
    // if (this.availableSizesWithDeactivated != null) {
    //   data['AvailableSizesWithDeactivated'] = this.availableSizesWithDeactivated!.map((v) => v.toJson()).toList();
    // }
    // if (this.sizeWiseStock != null) {
    //   data['SizeWiseStock'] = this.sizeWiseStock!.toJson();
    // }
    // if (this.sizeWiseStockPlant != null) {
    //   data['SizeWiseStockPlant'] = this.sizeWiseStockPlant!.toJson();
    // }
    // data['OfferMonths'] = this.offerMonths;
    // data['ProductClass'] = this.productClass;
    // data['Promoted'] = this.promoted;
    // data['Secondary'] = this.secondary;
    // data['Deactivated'] = this.deactivated;
    // data['DefaultSize'] = this.defaultSize;
    // data['Material'] = this.material;
    // data['Quality'] = this.quality;
    // data['QRCode2'] = this.qRCode2;
    // data['DisplayName'] = this.displayName;
    // data['DisplayOrder'] = this.displayOrder;
    // data['MinQuantity'] = this.minQuantity;
    // data['MaxQuantity'] = this.maxQuantity;
    // data['QPSCode'] = this.qPSCode;
    // data['DemandType'] = this.demandType;
    // data['Image'] = this.image;
    // data['ImageUrl'] = this.imageUrl;
    // data['ImageUrl2'] = this.imageUrl2;
    // data['ImageUrl3'] = this.imageUrl3;
    // data['ImageUrl4'] = this.imageUrl4;
    // data['ImageUrl5'] = this.imageUrl5;
    // data['ImageUrl6'] = this.imageUrl6;
    // data['ImageUrl7'] = this.imageUrl7;
    // data['ImageUrl8'] = this.imageUrl8;
    // data['ImageUrl9'] = this.imageUrl9;
    // data['ImageUrl10'] = this.imageUrl10;
    // data['ImageUrl11'] = this.imageUrl11;
    // data['ImageUrl12'] = this.imageUrl12;
    // data['AdShoot'] = this.adShoot;
    // data['Technology'] = this.technology;
    // data['ImageAlt'] = this.imageAlt;
    // data['TechnologyImage'] = this.technologyImage;
    // data['TechnologyImageUrl'] = this.technologyImageUrl;
    // data['IsCore'] = this.isCore;
    // data['MinimumArticleQuantity'] = this.minimumArticleQuantity;
    // data['Likeabilty'] = this.likeabilty;
    // data['BrandRank'] = this.brandRank;
    // if (this.gradeToRatiosApps != null) {
    //   data['GradeToRatiosApps'] = this.gradeToRatiosApps!.map((v) => v.toJson()).toList();
    // }
    // if (this.relatedProducts != null) {
    //   data['RelatedProducts'] = this.relatedProducts!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class EAN {
  String? s28;
  String? s30;
  String? s32;
  String? s34;
  String? s36;
  String? s38;
  String? s40;
  String? l;
  String? m;
  String? s;
  String? xL;
  String? xXL;
  String? xXXL;
  String? s42;
  String? xS;

  EAN({this.s28, this.s30, this.s32, this.s34, this.s36, this.s38, this.s40, this.l, this.m, this.s, this.xL, this.xXL, this.xXXL, this.s42, this.xS});

  EAN.fromJson(Map<String, dynamic> json) {
    s28 = json['28'];
    s30 = json['30'];
    s32 = json['32'];
    s34 = json['34'];
    s36 = json['36'];
    s38 = json['38'];
    s40 = json['40'];
    l = json['L'];
    m = json['M'];
    s = json['S'];
    xL = json['XL'];
    xXL = json['XXL'];
    xXXL = json['XXXL'];
    s42 = json['42'];
    xS = json['XS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['28'] = this.s28;
    data['30'] = this.s30;
    data['32'] = this.s32;
    data['34'] = this.s34;
    data['36'] = this.s36;
    data['38'] = this.s38;
    data['40'] = this.s40;
    data['L'] = this.l;
    data['M'] = this.m;
    data['S'] = this.s;
    data['XL'] = this.xL;
    data['XXL'] = this.xXL;
    data['XXXL'] = this.xXXL;
    data['42'] = this.s42;
    data['XS'] = this.xS;
    return data;
  }
}

class AvailableSizesWithDeactivated {
  String? size;
  bool? isDeactevated;

  AvailableSizesWithDeactivated({this.size, this.isDeactevated});

  AvailableSizesWithDeactivated.fromJson(Map<String, dynamic> json) {
    size = json['Size'];
    isDeactevated = json['IsDeactevated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Size'] = this.size;
    data['IsDeactevated'] = this.isDeactevated;
    return data;
  }
}

// class SizeWiseStock {
//
//
//   SizeWiseStock({});
//
// SizeWiseStock.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// return data;
// }
// }

class Brands {
String? name;
int? mOQ;

Brands({this.name, this.mOQ});

Brands.fromJson(Map<String, dynamic> json) {
name = json['Name'];
mOQ = json['MOQ'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['Name'] = this.name;
data['MOQ'] = this.mOQ;
return data;
}
}

// class Products {
// String? season;
// String? brand;
// String? mood;
// String? gender;
// String? theme;
// String? category;
// String? name;
// String? color;
// String? option;
// int? mRP;
// String? subCategory;
// String? collection;
// String? fit;
// String? description;
// String? qRCode;
// String? looks;
// var looksImageUrl;
// var looksImage;
// String? fabric;
// EAN? eAN;
// String? finish;
// List<String>? availableSizes;
// List<AvailableSizesWithDeactivated>? availableSizesWithDeactivated;
// //SizeWiseStock? sizeWiseStock;
// //SizeWiseStock? sizeWiseStockPlant;
// List<String>? offerMonths;
// int? productClass;
// bool? promoted;
// bool? secondary;
// bool? deactivated;
// var defaultSize;
// String? material;
// String? quality;
// String? qRCode2;
// String? displayName;
// int? displayOrder;
// int? minQuantity;
// int? maxQuantity;
// String? qPSCode;
// var demandType;
// String? image;
// String? imageUrl;
// String? imageUrl2;
// String? imageUrl3;
// String? imageUrl4;
// String? imageUrl5;
//   var imageUrl6;
//   var imageUrl7;
//   var imageUrl8;
//   var imageUrl9;
//   var imageUrl10;
//   var imageUrl11;
//   var imageUrl12;
// bool? adShoot;
// String? technology;
// String? imageAlt;
//   var technologyImage;
// String? technologyImageUrl;
// bool? isCore;
// int? minimumArticleQuantity;
// int? likeabilty;
// String? brandRank;
// List? gradeToRatiosApps;
// List? relatedProducts;
//
// Products({this.season, this.brand, this.mood, this.gender, this.theme, this.category, this.name, this.color, this.option, this.mRP, this.subCategory, this.collection, this.fit, this.description, this.qRCode, this.looks, this.looksImageUrl, this.looksImage, this.fabric, this.eAN, this.finish, this.availableSizes, this.availableSizesWithDeactivated,  this.offerMonths, this.productClass, this.promoted, this.secondary, this.deactivated, this.defaultSize, this.material, this.quality, this.qRCode2, this.displayName, this.displayOrder, this.minQuantity, this.maxQuantity, this.qPSCode, this.demandType, this.image, this.imageUrl, this.imageUrl2, this.imageUrl3, this.imageUrl4, this.imageUrl5, this.imageUrl6, this.imageUrl7, this.imageUrl8, this.imageUrl9, this.imageUrl10, this.imageUrl11, this.imageUrl12, this.adShoot, this.technology, this.imageAlt, this.technologyImage, this.technologyImageUrl, this.isCore, this.minimumArticleQuantity, this.likeabilty, this.brandRank, this.gradeToRatiosApps, this.relatedProducts});
//
// Products.fromJson(Map<String, dynamic> json) {
// season = json['Season'];
// brand = json['Brand'];
// mood = json['Mood'];
// gender = json['Gender'];
// theme = json['Theme'];
// category = json['Category'];
// name = json['Name'];
// color = json['Color'];
// option = json['Option'];
// mRP = json['MRP'];
// subCategory = json['SubCategory'];
// collection = json['Collection'];
// fit = json['Fit'];
// description = json['Description'];
// qRCode = json['QRCode'];
// looks = json['Looks'];
// looksImageUrl = json['LooksImageUrl'];
// looksImage = json['LooksImage'];
// fabric = json['Fabric'];
// eAN = json['EAN'] != null ? new EAN.fromJson(json['EAN']) : null;
// finish = json['Finish'];
// availableSizes = json['AvailableSizes'].cast<String>();
// if (json['AvailableSizesWithDeactivated'] != null) {
// availableSizesWithDeactivated = <AvailableSizesWithDeactivated>[];
// json['AvailableSizesWithDeactivated'].forEach((v) { availableSizesWithDeactivated!.add(new AvailableSizesWithDeactivated.fromJson(v)); });
// }
// //sizeWiseStock = json['SizeWiseStock'] != null ? new SizeWiseStock.fromJson(json['SizeWiseStock']) : null;
// //sizeWiseStockPlant = json['SizeWiseStockPlant'] != null ? new SizeWiseStock.fromJson(json['SizeWiseStockPlant']) : null;
// offerMonths = json['OfferMonths'].cast<String>();
// productClass = json['ProductClass'];
// promoted = json['Promoted'];
// secondary = json['Secondary'];
// deactivated = json['Deactivated'];
// defaultSize = json['DefaultSize'];
// material = json['Material'];
// quality = json['Quality'];
// qRCode2 = json['QRCode2'];
// displayName = json['DisplayName'];
// displayOrder = json['DisplayOrder'];
// minQuantity = json['MinQuantity'];
// maxQuantity = json['MaxQuantity'];
// qPSCode = json['QPSCode'];
// demandType = json['DemandType'];
// image = json['Image'];
// imageUrl = json['ImageUrl'];
// imageUrl2 = json['ImageUrl2'];
// imageUrl3 = json['ImageUrl3'];
// imageUrl4 = json['ImageUrl4'];
// imageUrl5 = json['ImageUrl5'];
// imageUrl6 = json['ImageUrl6'];
// imageUrl7 = json['ImageUrl7'];
// imageUrl8 = json['ImageUrl8'];
// imageUrl9 = json['ImageUrl9'];
// imageUrl10 = json['ImageUrl10'];
// imageUrl11 = json['ImageUrl11'];
// imageUrl12 = json['ImageUrl12'];
// adShoot = json['AdShoot'];
// technology = json['Technology'];
// imageAlt = json['ImageAlt'];
// technologyImage = json['TechnologyImage'];
// technologyImageUrl = json['TechnologyImageUrl'];
// isCore = json['IsCore'];
// minimumArticleQuantity = json['MinimumArticleQuantity'];
// likeabilty = json['Likeabilty'];
// brandRank = json['BrandRank'];
// // if (json['GradeToRatiosApps'] != null) {
// // gradeToRatiosApps = <Null>[];
// // json['GradeToRatiosApps'].forEach((v) { gradeToRatiosApps!.add(new Null.fromJson(v)); });
// // }
// // if (json['RelatedProducts'] != null) {
// // relatedProducts = <Null>[];
// // json['RelatedProducts'].forEach((v) { relatedProducts!.add(new Null.fromJson(v)); });
// // }
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Season'] = this.season;
// data['Brand'] = this.brand;
// data['Mood'] = this.mood;
// data['Gender'] = this.gender;
// data['Theme'] = this.theme;
// data['Category'] = this.category;
// data['Name'] = this.name;
// data['Color'] = this.color;
// data['Option'] = this.option;
// data['MRP'] = this.mRP;
// data['SubCategory'] = this.subCategory;
// data['Collection'] = this.collection;
// data['Fit'] = this.fit;
// data['Description'] = this.description;
// data['QRCode'] = this.qRCode;
// data['Looks'] = this.looks;
// data['LooksImageUrl'] = this.looksImageUrl;
// data['LooksImage'] = this.looksImage;
// data['Fabric'] = this.fabric;
// if (this.eAN != null) {
// data['EAN'] = this.eAN!.toJson();
// }
// data['Finish'] = this.finish;
// data['AvailableSizes'] = this.availableSizes;
// if (this.availableSizesWithDeactivated != null) {
// data['AvailableSizesWithDeactivated'] = this.availableSizesWithDeactivated!.map((v) => v.toJson()).toList();
// }
// // if (this.sizeWiseStock != null) {
// // data['SizeWiseStock'] = this.sizeWiseStock!.toJson();
// // }
// // if (this.sizeWiseStockPlant != null) {
// // data['SizeWiseStockPlant'] = this.sizeWiseStockPlant!.toJson();
// // }
// data['OfferMonths'] = this.offerMonths;
// data['ProductClass'] = this.productClass;
// data['Promoted'] = this.promoted;
// data['Secondary'] = this.secondary;
// data['Deactivated'] = this.deactivated;
// data['DefaultSize'] = this.defaultSize;
// data['Material'] = this.material;
// data['Quality'] = this.quality;
// data['QRCode2'] = this.qRCode2;
// data['DisplayName'] = this.displayName;
// data['DisplayOrder'] = this.displayOrder;
// data['MinQuantity'] = this.minQuantity;
// data['MaxQuantity'] = this.maxQuantity;
// data['QPSCode'] = this.qPSCode;
// data['DemandType'] = this.demandType;
// data['Image'] = this.image;
// data['ImageUrl'] = this.imageUrl;
// data['ImageUrl2'] = this.imageUrl2;
// data['ImageUrl3'] = this.imageUrl3;
// data['ImageUrl4'] = this.imageUrl4;
// data['ImageUrl5'] = this.imageUrl5;
// data['ImageUrl6'] = this.imageUrl6;
// data['ImageUrl7'] = this.imageUrl7;
// data['ImageUrl8'] = this.imageUrl8;
// data['ImageUrl9'] = this.imageUrl9;
// data['ImageUrl10'] = this.imageUrl10;
// data['ImageUrl11'] = this.imageUrl11;
// data['ImageUrl12'] = this.imageUrl12;
// data['AdShoot'] = this.adShoot;
// data['Technology'] = this.technology;
// data['ImageAlt'] = this.imageAlt;
// data['TechnologyImage'] = this.technologyImage;
// data['TechnologyImageUrl'] = this.technologyImageUrl;
// data['IsCore'] = this.isCore;
// data['MinimumArticleQuantity'] = this.minimumArticleQuantity;
// data['Likeabilty'] = this.likeabilty;
// data['BrandRank'] = this.brandRank;
// if (this.gradeToRatiosApps != null) {
// data['GradeToRatiosApps'] = this.gradeToRatiosApps!.map((v) => v.toJson()).toList();
// }
// if (this.relatedProducts != null) {
// data['RelatedProducts'] = this.relatedProducts!.map((v) => v.toJson()).toList();
// }
// return data;
// }
// }