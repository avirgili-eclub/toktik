import 'package:toktik/domain/datasources/video_posts_datasoruce.dart';
import 'package:toktik/domain/entities/video_post.dart';

import '../../shared/data/local_video_posts.dart';
import '../models/local_video_model.dart';

class LocalVideoPostsDataSourceImpl implements VideoPostsDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
