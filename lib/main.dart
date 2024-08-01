import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/course_provider.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/course_list_screen.dart';
import 'screens/course_detail_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Flutter App',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/courses': (context) => CourseListScreen(),
          '/profile': (context) => ProfileScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/courseDetail') {
            final courseId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => CourseDetailScreen(courseId: courseId),
            );
          }
          return null;
        },
      ),
    );
  }
}
