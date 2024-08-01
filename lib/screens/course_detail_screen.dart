import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseId;

  CourseDetailScreen({required this.courseId});

  @override
  Widget build(BuildContext context) {
    final course = context.read<CourseProvider>().getCourseById(courseId);

    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(course.thumbnailUrl),
            SizedBox(height: 16),
            Text(course.description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('Instructor: ${course.instructor}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Lessons:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...course.lessons.map((lesson) => Text(lesson)).toList(),
          ],
        ),
      ),
    );
  }
}
