import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_app/utilities/base_controller.dart';
import 'package:crud_app/screens/views/home/home_navigator.dart';
import '../../../model/post_model.dart';

class HomeController extends BaseController implements HomeNavigator {
  var posts = <PostModel>[].obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() {
    apiClient.getRequest(
      endPath: "posts",
      onSuccessHandler: (response) {
        var data = response.data as List;
        posts.assignAll(data.map((json) => PostModel.fromJson(json)).toList());
      },
    );
  }

  void addPost(String title, String body) {
    apiClient.postRequest(
      endPath: "posts",
      data: {'title': title, 'body': body},
      onSuccessHandler: (response) {
        posts.add(PostModel.fromJson(response.data));
      },
    );
  }

  void updatePost(int id, String title, String body) {
    apiClient.putRequest(
      endPath: "posts/$id",
      data: {'title': title, 'body': body},
      onSuccessHandler: (response) {
        int index = posts.indexWhere((p) => p.id == id);
        if (index != -1) {
          posts[index] = PostModel.fromJson(response.data);
        }
      },
    );
  }

  void deletePost(int id) {
    apiClient.deleteRequest(
      endPath: "posts/$id",
      onSuccessHandler: (response) {
        posts.removeWhere((p) => p.id == id);
      },
    );
  }

  @override
  navigateScreen(HomeNavigateScreens screen, [String param = ""]) {
    switch (screen) {
      case HomeNavigateScreens.homePage:
        break;
    }
  }
}