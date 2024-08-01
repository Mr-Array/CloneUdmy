import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  CourseItem({required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(course.thumbnailUrl),
              SizedBox(height: 8.0),
              Text(
                course.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(course.description),
            ],
          ),
        ),
      ),
    );
  }
}
