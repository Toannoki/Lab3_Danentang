import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/app_data.dart';

class AddEditScreen extends StatefulWidget {
  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedCategory = AppData.categories.first;
  int? _editingIndex;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null && args.containsKey('post')) {
      final Post post = args['post'];
      _editingIndex = args['index'];
      _titleController.text = post.title;
      _contentController.text = post.content;
      _selectedCategory = post.category;
    }
    super.didChangeDependencies();
  }

  void _save() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) return;

    final newPost = Post(
      title: _titleController.text,
      content: _contentController.text,
      category: _selectedCategory,
    );

    if (_editingIndex == null) {
      AppData.posts.add(newPost); // Thêm mới
    } else {
      AppData.posts[_editingIndex!] = newPost; // Cập nhật
    }

    Navigator.pop(context); // Trở về
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_editingIndex == null ? "Thêm bài viết" : "Sửa bài viết")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Tiêu đề", border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: "Nội dung", border: OutlineInputBorder()),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(labelText: "Danh mục", border: OutlineInputBorder()),
              items: AppData.categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _selectedCategory = val);
              },
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _save,
              icon: Icon(Icons.save),
              label: Text("Lưu bài viết"),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            )
          ],
        ),
      ),
    );
  }
}