class ProductModel {
  int? id;
  String? productName;
  String? latitute;
  String? longitute;
  String? description;
  String? condition;
  int? price;
  var commissionAmount;
  String? address;
  int? quantity;
  String? paymentMethod;
  String? shippingMethod;
  int? commission;
  String? avgRating;
  List<ProductImage>? productImage;
  UserDetail? userDetail;
  BrandDetail? brandDetail;
  var productLiked;
  Subcat? subcat;

  ProductModel(
      {this.id,
      this.productName,
      this.latitute,
      this.longitute,
      this.description,
      this.condition,
      this.price,
      this.commissionAmount,
      this.address,
      this.quantity,
      this.paymentMethod,
      this.shippingMethod,
      this.commission,
      this.avgRating,
      this.productImage,
      this.userDetail,
      this.brandDetail,
      this.productLiked,
      this.subcat});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    latitute = json['latitute'];
    longitute = json['longitute'];
    description = json['description'];
    condition = json['condition'];
    price = json['price'];
    commissionAmount = json['commission_amount'];
    address = json['address'];
    quantity = json['quantity'];
    paymentMethod = json['payment_method'];
    shippingMethod = json['shipping_method'];
    commission = json['commission'];
    avgRating = json['avgRating'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(ProductImage.fromJson(v));
      });
    }
    userDetail = json['user_detail'] != null
        ? UserDetail.fromJson(json['user_detail'])
        : null;
    brandDetail = json['brand_detail'] != null
        ? BrandDetail.fromJson(json['brand_detail'])
        : null;
    productLiked = json['product_liked'];
    subcat =
        json['subcat'] != null ? Subcat.fromJson(json['subcat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['latitute'] = latitute;
    data['longitute'] = longitute;
    data['description'] = description;
    data['condition'] = condition;
    data['price'] = price;
    data['commission_amount'] = commissionAmount;
    data['address'] = address;
    data['quantity'] = quantity;
    data['payment_method'] = paymentMethod;
    data['shipping_method'] = shippingMethod;
    data['commission'] = commission;
    data['avgRating'] = avgRating;
    if (productImage != null) {
      data['product_image'] =
          productImage!.map((v) => v.toJson()).toList();
    }
    if (userDetail != null) {
      data['user_detail'] = userDetail!.toJson();
    }
    if (brandDetail != null) {
      data['brand_detail'] = brandDetail!.toJson();
    }
    data['product_liked'] = productLiked;
    if (subcat != null) {
      data['subcat'] = subcat!.toJson();
    }
    return data;
  }
}

class ProductImage {
  int? id;
  int? productId;
  String? image;
  String? image2;
  String? image3;
  String? createdAt;
  String? updatedAt;

  ProductImage(
      {this.id,
      this.productId,
      this.image,
      this.image2,
      this.image3,
      this.createdAt,
      this.updatedAt});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    image2 = json['image2'];
    image3 = json['image3'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['image'] = image;
    data['image2'] = image2;
    data['image3'] = image3;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class UserDetail {
  int? id;
  String? name;
  String? phoneNo;
  String? userType;
  String? colleageName;
  String? collegeYear;
  String? email;
  var emailVerifiedAt;
  String? password;
  var linkSendTime;
  String? designation;
  var colleageId;
  String? forgetPasswordToken;
  String? rememberToken;
  String? colleageAddress;
  int? isEmailNotification;
  String? status;
  String? idImage;
  String? userImage;
  String? gender;
  var countryCode;
  int? otp;
  String? isVerified;
  String? createdAt;
  String? updatedAt;

  UserDetail(
      {this.id,
      this.name,
      this.phoneNo,
      this.userType,
      this.colleageName,
      this.collegeYear,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.linkSendTime,
      this.designation,
      this.colleageId,
      this.forgetPasswordToken,
      this.rememberToken,
      this.colleageAddress,
      this.isEmailNotification,
      this.status,
      this.idImage,
      this.userImage,
      this.gender,
      this.countryCode,
      this.otp,
      this.isVerified,
      this.createdAt,
      this.updatedAt});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNo = json['phone_no'];
    userType = json['user_type'];
    colleageName = json['colleage_name'];
    collegeYear = json['college_year'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    linkSendTime = json['link_send_time'];
    designation = json['designation'];
    colleageId = json['colleage_id'];
    forgetPasswordToken = json['forget_password_token'];
    rememberToken = json['remember_token'];
    colleageAddress = json['colleage_address'];
    isEmailNotification = json['is_email_notification'];
    status = json['status'];
    idImage = json['id_image'];
    userImage = json['user_image'];
    gender = json['gender'];
    countryCode = json['country_code'];
    otp = json['otp'];
    isVerified = json['is_verified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_no'] = phoneNo;
    data['user_type'] = userType;
    data['colleage_name'] = colleageName;
    data['college_year'] = collegeYear;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['link_send_time'] = linkSendTime;
    data['designation'] = designation;
    data['colleage_id'] = colleageId;
    data['forget_password_token'] = forgetPasswordToken;
    data['remember_token'] = rememberToken;
    data['colleage_address'] = colleageAddress;
    data['is_email_notification'] = isEmailNotification;
    data['status'] = status;
    data['id_image'] = idImage;
    data['user_image'] = userImage;
    data['gender'] = gender;
    data['country_code'] = countryCode;
    data['otp'] = otp;
    data['is_verified'] = isVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class BrandDetail {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  BrandDetail({this.id, this.name, this.createdAt, this.updatedAt});

  BrandDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Subcat {
  int? id;
  int? categoryId;
  String? name;
  String? createdAt;
  String? updatedAt;
  BrandDetail? catName;

  Subcat(
      {this.id,
      this.categoryId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.catName});

  Subcat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    catName = json['cat_name'] != null
        ? BrandDetail.fromJson(json['cat_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (catName != null) {
      data['cat_name'] = catName!.toJson();
    }
    return data;
  }
}
