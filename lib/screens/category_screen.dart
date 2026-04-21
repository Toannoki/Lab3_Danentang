import 'package:flutter/material.dart';
import '../models/app_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: AppData.categories.length,
      itemBuilder: (context, index) {
        String categoryName = AppData.categories[index];
        return InkWell(
          onTap: () {
            // TRUYỀN DỮ LIỆU: Gửi tên danh mục sang màn hình chi tiết
            Navigator.pushNamed(
                context,
                '/category_detail',
                arguments: categoryName
            );
          },
          child: Card(
            color: Colors.blueAccent.withOpacity(0.8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(
                categoryName,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}