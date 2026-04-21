import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, backgroundColor: Colors.blue, child: Icon(Icons.person, size: 50, color: Colors.white)),
          SizedBox(height: 20),
          Text("Huỳnh Thái Toàn", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("MSSV: 2224802010007", style: TextStyle(fontSize: 18, color: Colors.grey)),
          SizedBox(height: 10),
          Text("Lớp: D22CNTT01", style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}