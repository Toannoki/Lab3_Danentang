import 'post.dart';

class AppData {
  // Danh sách danh mục mặc định
  static const List<String> categories = ["Học tập", "Công việc", "Giải trí", "Khác"];

  // Danh sách bài viết
  static List<Post> posts = [
    Post(title: "Xin chào", content: "Đây là bài viết đầu tiên", category: "Khác"),
    Post(title: "Học Flutter", content: "Làm bài Lab Navigation", category: "Học tập"),
    Post(title: "Nghe nhạc", content: "Playlist Lofi chill", category: "Giải trí"),
  ];
}