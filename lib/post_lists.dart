import 'package:flutter/material.dart';
import 'home_page.dart';

class PostLists extends StatefulWidget {
  final List<Post> listItems;
  PostLists(this.listItems);

  @override
  State<PostLists> createState() => _PostListsState();
}

class _PostListsState extends State<PostLists> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: ,
        )
      },
    );
  }
}
