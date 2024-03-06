class CustomerModel {
  final String name;
  final String email;
  final String location;

  final String profileImage;

  final String uId;

  CustomerModel(
      {required this.name,
      required this.email,
      required this.location,
      required this.profileImage,
      required this.uId});

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
        name: map['name'],
        email: map['email'],
        location: map['location'],
        profileImage: map['profileImage'],
        uId: map['userId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'profileImage': profileImage,
      'uId': uId,
    };
  }
}
