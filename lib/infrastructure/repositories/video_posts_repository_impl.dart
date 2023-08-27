import 'package:toktik/domain/datasources/video_posts_datasoruce.dart';
import 'package:toktik/domain/entities/video_post.dart';

import '../../domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostsRepository {
  final VideoPostsDataSource videosPostsDataSource;

  VideoPostsRepositoryImpl({required this.videosPostsDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosPostsDataSource.getTrendingVideosByPage(page);
  }
}
