class Course {
  final String id;
  final String title;
  final String description;
  final String instructor;
  final String thumbnailUrl;
  final List<String> lessons;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.thumbnailUrl,
    required this.lessons,
  });

  // Factory method to create a Course from JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      instructor: json['instructor'],
      thumbnailUrl: json['thumbnailUrl'],
      lessons: List<String>.from(json['lessons']),
    );
  }

  // Method to convert a Course to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'instructor': instructor,
      'thumbnailUrl': thumbnailUrl,
      'lessons': lessons,
    };
  }
}
