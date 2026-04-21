import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/app_data.dart';

class CategoryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NHẬN DỮ LIỆU: Lấy tên danh mục từ Navigator arguments
    final String categoryName = ModalRoute.of(context)!.settings.arguments as String;

    // Lọc danh sách bài viết theo danh mục
    final List<Post> categoryPosts = AppData.posts.where((post) => post.category == categoryName).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Danh mục: $categoryName")),
      body: categoryPosts.isEmpty
          ? Center(child: Text("Chưa có bài viết nào trong mục này."))
          : ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: categoryPosts.length,
        itemBuilder: (context, index) {
          final post = categoryPosts[index];
          return Card(
            child: ListTile(
              title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(post.content, maxLines: 2, overflow: TextOverflow.ellipsis),
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: {
                  'post': post,
                  'index': AppData.posts.indexOf(post), // Lấy index gốc
                });
              },
            ),
          );
        },
      ),
    );
  }
}