class ApplianceModel {
  final String? name;
  final String? price;
  final String? image;
  final String? docId;
  final String? uId;

  ApplianceModel({this.name, this.price, this.image, this.docId, this.uId});

  factory ApplianceModel.fromMap(Map<String, dynamic> map) {
    return ApplianceModel(
        name: map['name'],
        price: map['price'],
        image: map['image'],
        docId: map['docId'],
        uId: map['userId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'docId': docId,
      'uId': uId,
    };
  }
}
