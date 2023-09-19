import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepositories;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepositories});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos= videoPosts.map(
    //   (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    // ).toList();

    // videosRepositories.getTrendingVideosByPage(1).then((value) {
    //   videos.addAll(value);
    //   initialLoading = false;

    //   notifyListeners();
    // });

    final newVideos=await videosRepositories.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading=false;

    notifyListeners();
  }
}
