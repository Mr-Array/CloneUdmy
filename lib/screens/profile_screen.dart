import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: user != null
            ? Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.profilePictureUrl),
                  ),
                  SizedBox(height: 20),
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthProvider>().logout();
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Logout'),
                  ),
                ],
              )
            : Center(child: Text('No user logged in')),
      ),
    );
  }
}
