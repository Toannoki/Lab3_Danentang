import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/app_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: AppData.posts.length,
        itemBuilder: (context, index) {
          final post = AppData.posts[index];
          return Card(
            elevation: 2,
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.1),
                child: Icon(Icons.article, color: Colors.blue),
              ),
              title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(post.content, maxLines: 1, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 5),
                  Chip(
                    label: Text(post.category, style: TextStyle(fontSize: 10)),
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() => AppData.posts.removeAt(index));
                },
              ),
              onTap: () async {
                await Navigator.pushNamed(context, '/detail', arguments: {'post': post, 'index': index});
                _refresh();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          _refresh();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}