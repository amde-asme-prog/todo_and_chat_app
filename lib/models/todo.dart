import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String documentID;
  final String title;
  final String description;
  final Timestamp date;
  final String owner;

  Todo({
    required this.documentID,
    required this.title,
    required this.description,
    required this.date,
    required this.owner,
  });

  Todo copyWith({
    String? documentID,
    String? title,
    String? description,
    Timestamp? date,
    String? owner,
  }) {
    return Todo(
      documentID: documentID ?? this.documentID,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'date': date.toDate().toString(),
        'owner': owner,
      };

  static Todo fromJson(String id, Map<String, dynamic> json) {
    return Todo(
      documentID: id,
      title: json['title'] as String,
      description: json['description'] as String,
      date: Timestamp.fromDate(DateTime.parse(json['date'] as String)),
      owner: json['owner'] as String,
    );
  }
}
