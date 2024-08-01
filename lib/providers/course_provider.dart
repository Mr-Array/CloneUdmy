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
        title: 'Course $index',
        description: 'Description for Course $index',
        instructor: 'Instructor $index',
        thumbnailUrl: 'http://example.com/course$index.jpg',
        lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3'],
      ),
    );
    notifyListeners();
  }
}
