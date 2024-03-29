class TechnicianModel {
  final String name;
  final String email;
  final String location;
  final String price;
  final String about;
  final String skill;
  final String profileImage;
  final String status;
  final String uId;

  TechnicianModel(
      {required this.name,
      required this.email,
      required this.location,
      required this.skill,
      required this.price,
      required this.profileImage,
      required this.status,
      required this.about,
      required this.uId});

  factory TechnicianModel.fromMap(Map<String, dynamic> map) {
    return TechnicianModel(
        name: map['name'],
        email: map['email'],
        location: map['location'],
        skill: map['skill'],
        price: map['price'],
        about: map['about'],
        profileImage: map['profileImage'],
        status: map['status'],
        uId: map['userId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'skill': skill,
      'price': price,
      'about': about,
      'profileImage': profileImage,
      'status': status,
      'uId': uId,
    };
  }
}
