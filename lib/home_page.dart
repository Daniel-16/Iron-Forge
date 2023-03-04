import 'package:flutter/material.dart';
import 'post_lists.dart';
import 'text_input.dart';

class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;
  Post({required this.body, required this.author});
  void likePost() {
    userLiked = !userLiked;
    if (userLiked) {
      likes += 1;
    } else {
      likes -= 1;
    }
  }
}

//Stateful widget for button onPressed in the text field
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
  void newPosts(String text) {
    setState(() {
      Post newPost = Post(body: text, author: "Daniel");
      posts.add(newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Column(children: <Widget>[
        Expanded(child: PostLists(posts)),
        Expanded(child: TextInputWidget(newPosts)),
      ]),
    );
  }
}
