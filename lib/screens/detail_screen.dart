import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/app_data.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Post post = args['post'];
    final int index = args['index'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết bài viết"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              AppData.posts.removeAt(index);
              Navigator.pop(context); // Về màn trước
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              await Navigator.pushNamed(context, '/add', arguments: {'post': post, 'index': index});
              Navigator.pop(context); // Đóng detail hiện tại để tải lại từ nguồn
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(post.category, style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.blue,
                ),
                SizedBox(height: 10),
                Hero(
                  tag: post.title,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(post.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                Text(post.content, style: TextStyle(fontSize: 16, height: 1.6)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}