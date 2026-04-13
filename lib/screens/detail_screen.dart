import 'package:flutter/material.dart';
import '../models/post.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final Post post = args['post'];
    final int index = args['index'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context, {'delete': true});
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              final updatedPost = await Navigator.pushNamed(
                context,
                '/add',
                arguments: post,
              );

              if (updatedPost != null) {
                Navigator.pop(context, {'post': updatedPost});
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: post.title,
              child: Material(
                child: Text(
                  post.title,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: 1,
              child: Text(post.content),
            ),
          ],
        ),
      ),
    );
  }
}