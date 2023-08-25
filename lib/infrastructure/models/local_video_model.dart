import '../../domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String url;
  final int likes;
  final int comments;
  final int views;

  LocalVideoModel(
      {required this.name,
      required this.url,
      this.likes = 0,
      this.comments = 0,
      this.views = 0});

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
          name: json['name'] ?? "no name",
          url: json['videoUrl'],
          likes: json['likes'] ?? 0,
          comments: json['comments'] ?? 0,
          views: json['views'] ?? 0);

  Map<String, dynamic> toJson() => {
        'name': name,
        'videoUrl': url,
        'likes': likes,
        'comments': comments,
        'views': views
      };

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: url,
        likes: likes,
        views: views,
      );
}
