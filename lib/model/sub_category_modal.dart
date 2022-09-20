class SubCategoryModal {
  Body body;
  String status;

  SubCategoryModal({this.body, this.status});

  SubCategoryModal.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Body {
  List<Subcategories> subcategories;

  Body({this.subcategories});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  dynamic id;
  String name;
  dynamic categoryId;
  dynamic userId;
  String description;
  String image;
  String slug;
  String createdAt;
  String updatedAt;

  Subcategories(
      {this.id,
        this.name,
        this.categoryId,
        this.userId,
        this.description,
        this.image,
        this.slug,
        this.createdAt,
        this.updatedAt});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    description = json['description'];
    image = json['image'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}