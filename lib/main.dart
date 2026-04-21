import 'package:flutter/material.dart';
import 'screens/main_layout.dart';
import 'screens/detail_screen.dart';
import 'screens/add_edit_screen.dart';
import 'screens/category_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huỳnh Thái Toàn - 2224802010007',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainLayout(),
        '/detail': (context) => DetailScreen(),
        '/add': (context) => AddEditScreen(),
        '/category_detail': (context) => CategoryDetailScreen(), // Màn hình mới
      },
    );
  }
}