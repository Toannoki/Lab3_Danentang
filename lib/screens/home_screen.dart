import 'package:flutter/material.dart';
import '../models/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [
    Post(title: "Xin chào", content: "Đây là bài viết đầu tiên"),
  ];

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
    });
  }

  void _addOrUpdate(Post post, [int? index]) {
    setState(() {
      if (index == null) {
        posts.add(post);
      } else {
        posts[index] = post;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Huỳnh Thái Toàn - 2224802010007"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.black12),
              ],
            ),
            child: ListTile(
              title: Hero(
                tag: post.title,
                child: Material(
                  child: Text(
                    post.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              subtitle: Text(post.content),
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: {
                    'post': post,
                    'index': index,
                  },
                );

                if (result != null && result is Map<String, dynamic>) {
                  if (result['delete'] == true) {
                    _deletePost(index);
                  } else if (result['post'] != null) {
                    _addOrUpdate(result['post'], index);
                  }
                }
              },
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deletePost(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPost = await Navigator.pushNamed(context, '/add');

          if (newPost != null) {
            _addOrUpdate(newPost as Post);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}