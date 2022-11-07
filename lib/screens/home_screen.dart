import 'package:flutter/material.dart';
import 'package:flutter_http/screens/comments_screen.dart';
import 'package:flutter_http/screens/photo_screen.dart';
import 'package:flutter_http/screens/post_screen.dart';
import 'package:flutter_http/screens/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextStyle myStyle = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w800,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: ((() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const UserScreen()),
                    ),
                  ))),
              child: const Text('All users'),
            ),
            TextButton(
              onPressed: ((() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const CommentScreen()),
                    ),
                  ))),
              child: const Text('All comments'),
            ),
            ElevatedButton(
              onPressed: ((() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const PostScreen()),
                    ),
                  ))),
              child: const Text('Post'),
            ),
            ElevatedButton(
              onPressed: ((() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const PhotoScreen()),
                    ),
                  ))),
              child: const Text('Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
