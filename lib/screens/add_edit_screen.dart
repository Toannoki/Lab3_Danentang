import 'package:flutter/material.dart';
import '../models/post.dart';

class AddEditScreen extends StatefulWidget {
  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void didChangeDependencies() {
    final post = ModalRoute.of(context)?.settings.arguments as Post?;

    if (post != null) {
      _titleController.text = post.title;
      _contentController.text = post.content;
    }

    super.didChangeDependencies();
  }

  void _save() {
    final newPost = Post(
      title: _titleController.text,
      content: _contentController.text,
    );

    Navigator.pop(context, newPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm / Sửa bài"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Tiêu đề"),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: "Nội dung"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: Text("Lưu"),
            )
          ],
        ),
      ),
    );
  }
}