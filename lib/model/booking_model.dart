class BookingModel {
  final String name;
  final String location;
  final String category;
  final String service;
  final String issue;
  final String dueDate;
  final String docId;

  BookingModel({
    required this.name,
    required this.location,
    required this.category,
    required this.service,
    required this.issue,
    required this.dueDate,
    required this.docId,
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      name: map['name'],
      location: map['location'],
      category: map['category'],
      service: map['service'],
      issue: map['issue'],
      dueDate: map['dueDate'],
      docId: map['docId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'category': category,
      'service': service,
      'issue': issue,
      'dueDate': dueDate,
      'docId': docId,
    };
  }
}
