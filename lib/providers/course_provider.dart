import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  Course getCourseById(String id) {
    return _courses.firstWhere((course) => course.id == id);
  }

  Future<void> fetchCourses() async {
    // Simulate fetching courses from an API
    await Future.delayed(Duration(seconds: 2));
    _courses = List.generate(
      10,
      (index) => Course(
        id: '$index',
        title: 'Google Digital Marketing E-commerce $index',
        description:
            'Description for Course Google Digital Marketing E-commerce $index',
        instructor: 'Instructor $index',
        thumbnailUrl:
            'https://mostaql.hsoubcdn.com/uploads/thumbnails/1119216/64de4a4484465/google-digital-marketing-e-commerce-certificate.png',
        lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3'],
      ),
    );
    notifyListeners();
  }
}
