import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_item.dart';

class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<CourseProvider>().fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Consumer<CourseProvider>(
            builder: (context, courseProvider, child) {
              return ListView.builder(
                itemCount: courseProvider.courses.length,
                itemBuilder: (context, index) {
                  final course = courseProvider.courses[index];
                  return CourseItem(
                    course: course,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/courseDetail',
                        arguments: course.id,
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
