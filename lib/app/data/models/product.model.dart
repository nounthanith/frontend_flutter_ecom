class Product {
  List<Categories>? categories;
  List<FeaturedProducts>? featuredProducts;

  Product({this.categories, this.featuredProducts});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['featured_products'] != null) {
      featuredProducts = <FeaturedProducts>[];
      json['featured_products'].forEach((v) {
        featuredProducts!.add(new FeaturedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.featuredProducts != null) {
      data['featured_products'] =
          this.featuredProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? categoryId;
  String? categoryName;
  String? categoryDescription;
  List<Products>? products;

  Categories(
      {this.categoryId,
        this.categoryName,
        this.categoryDescription,
        this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_description'] = this.categoryDescription;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stock;
  String? image;

  Products(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stock,
        this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['image'] = this.image;
    return data;
  }
}

class FeaturedProducts {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;

  FeaturedProducts(
      {this.id, this.name, this.description, this.image, this.price});

  FeaturedProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
