import 'package:crud_app/resource/app_font.dart';
import 'package:crud_app/widgets/primary_text.dart';
import 'package:crud_app/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_app/screens/views/home/home_controller.dart';
import 'package:crud_app/widgets/primary_scaffold.dart';
import '../../../model/post_model.dart';
import '../../../resource/app_colors.dart';
import '../../../resource/app_dimension.dart';
import '../../../widgets/primary_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      appBarTitle: 'Hi! Welcome to the CRUD App.',
      isLeadingIconDisable: true,
      body: Obx(() {
        return controller.posts.isEmpty ?
            Center(
              child: PrimaryText(
                text: "No posts found!",
                size: AppDimen.textSize18,
                color: AppColors.textColor.withValues(alpha: 0.8),
              ),
            ) : Container(
          padding: EdgeInsets.only(bottom: 100),
          child: ListView.separated(
            padding: EdgeInsets.all(AppDimen.appMargin),
            itemCount: controller.posts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final post = controller.posts.reversed.toList()[index];
              return _customCardView(post,index);
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostDialog(),
        backgroundColor: AppColors.primaryColor,
        elevation: 10,
        child: Icon(Icons.add, color: AppColors.whiteIconColor,size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _customCardView(PostModel post,int index) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteBgColor,
        borderRadius: AppDimen.borderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
              text: post.title,
              size: AppDimen.textSize18,
              weight: AppFont.bold,
          ),
          const SizedBox(height: 8),
          PrimaryText(
            text: post.body,
            size: AppDimen.textSize14,
            weight: AppFont.medium,
            color: AppColors.textColor.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: AppColors.primaryColor),
                onPressed: () => _showPostDialog(id: post.id),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.redColor),
                onPressed: () => controller.deletePost(post.id ?? 0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPostDialog({int? id}) {
    if (id != null) {
      final post = controller.posts.firstWhere((p) => p.id == id);
      controller.titleController.text = post.title;
      controller.bodyController.text = post.body;
    } else {
      controller.titleController.clear();
      controller.bodyController.clear();
    }

    Get.dialog(
      barrierColor: AppColors.textColor.withValues(alpha: 0.8),
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppDimen.borderRadius,
        ),
        backgroundColor: AppColors.whiteBgColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 30.0,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: id == null ? "Add Post" : "Update Post",
                weight: AppFont.bold,
                size: AppDimen.textSize20,
                color: AppColors.primaryColor,
              ),
              PrimaryTextField(controller: controller.titleController, label: "Title"),
              PrimaryTextField(controller: controller.bodyController, label: "Body",maxLines: 3,),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                    onTap: (){
                      Get.back();
                    },
                    btnText: "Cancel",
                    buttonTypeEnum: ButtonTypeEnum.outlineType,
                  ),
                  const SizedBox(width: 15),
                  PrimaryButton(
                    onTap: (){
                      if (controller.titleController.text.isNotEmpty && controller.bodyController.text.isNotEmpty) {
                        if (id == null) {
                          controller.addPost(controller.titleController.text, controller.bodyController.text);
                        } else {
                          controller.updatePost(id, controller.titleController.text, controller.bodyController.text);
                        }
                        Get.back();
                      }
                    },
                    btnText:  id == null ? "Add" : "Update",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}