import 'package:crud_app/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constant.dart' as constants;
import '../resource/app_colors.dart';
import '../resource/app_dimension.dart';
import '../resource/app_font.dart';

class PrimaryScaffold extends StatelessWidget {
  final Widget? body;
  final Color backgroundColor;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBrBottom;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final String appBarTitle;
  final List<Widget>? action;
  final bool isLeadingIconDisable;
  final Widget? bottomNavigationBar;

  const PrimaryScaffold(
      {super.key,
      this.appBarTitle = '',
      this.body,
      this.backgroundColor = AppColors.backgroundColor,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.appBrBottom,
      this.action,
      this.bottomNavigationBar,
      this.isLeadingIconDisable = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
      backgroundColor: backgroundColor,
      appBar: appBarTitle.isEmpty
          ? null
          : AppBar(
              leading: isLeadingIconDisable
                  ? null
                  : IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                      ),
                    ),
              toolbarHeight: 80.0,
              foregroundColor: AppColors.primaryColor,
              bottom: appBrBottom,
              backgroundColor: AppColors.backgroundColor,
              title: Padding(
                padding: const EdgeInsets.only(top: 28),
                child: PrimaryText(
                  text: appBarTitle,
                  color: AppColors.primaryColor,
                  weight: AppFont.bold,
                  size: AppDimen.textSize24,
                ),
              ),
              actions: action ?? [],
            ),
      body: Stack(
        children: [
          body ?? const SizedBox.shrink(),
          Obx(
            () => Visibility(
              visible: constants.isCommonApiLoader.value,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    ));
  }
}
