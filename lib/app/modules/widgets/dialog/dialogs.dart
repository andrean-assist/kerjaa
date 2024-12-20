import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../init/controllers/init_controller.dart';
import '../buttons/buttons.dart';

abstract class Dialogs {
  static Widget builderAction({
    required String textButton,
    bool? result,
  }) {
    return Buttons.text(
      child: Text(textButton),
      onPressed: () => Get.back(result: result),
    );
  }

  static Future<bool?> fullScreen({
    required BuildContext context,
    required String title,
    TextStyle? titleTextStyle,
    required List<Widget>? actions,
    required Widget content,
  }) {
    return showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            leading: CloseButton(
              onPressed: () => Get.back(result: false),
            ),
            title: Text(
              title,
              style: titleTextStyle,
            ),
            actions: actions,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ),
      ),
    );
  }

  static Future<bool?> alert({
    required BuildContext context,
    required String title,
    TextStyle? titleTextStyle,
    required Widget content,
    TextStyle? contentTextStyle,
    Widget? icon,
    List<Widget>? actions,
    MainAxisAlignment? actionsAlignment,
    bool barrierDismissible = true,
    bool isSingleAction = false,
    String? textNo,
    String? textYes,
  }) {
    List<Widget> builderActions;

    if (actions != null) {
      builderActions = actions;
    } else {
      if (isSingleAction) {
        builderActions = [builderAction(textButton: 'Tutup')];
      } else {
        builderActions = [
          builderAction(textButton: textNo ?? 'Tidak', result: false),
          builderAction(textButton: textYes ?? 'Iya', result: true),
        ];
      }
    }

    return showAdaptiveDialog<bool?>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        icon: icon,
        title: Text(title),
        titleTextStyle: titleTextStyle,
        contentTextStyle: contentTextStyle,
        content: content,
        actions: builderActions,
        actionsAlignment: actionsAlignment ?? MainAxisAlignment.end,
      ),
    );
  }

  static Future<bool?> loading({
    required BuildContext context,
    Widget? content,
    String? message,
    bool isDismissable = false,
  }) {
    final textTheme = context.textTheme;

    return showAdaptiveDialog<bool?>(
      context: context,
      barrierDismissible: isDismissable,
      builder: (context) => AlertDialog(
        content: content ??
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator.adaptive(),
                const SizedBox(height: 18),
                Text(
                  message ?? 'Loading.....',
                  style: textTheme.labelLarge,
                ),
              ],
            ),
      ),
    );
  }

  static Future<bool?> logout({
    required BuildContext context,
    required InitController initC,
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    List<Widget>? actions,
    MainAxisAlignment? actionsAlignment,
    bool barrierDismissible = true,
    String? textNo,
    String? textYes,
  }) async {
    return await showAdaptiveDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog.adaptive(
        icon: const Icon(Icons.logout_rounded),
        title: const Text('Logout'),
        titleTextStyle: titleTextStyle,
        contentTextStyle: contentTextStyle,
        content: const Text('Apakah anda yakin ingin logout dari aplikasi?'),
        actions: actions ??
            [
              Buttons.text(
                onPressed: () => Get.back(result: false),
                child: Text(textNo ?? 'Tidak'),
              ),
              Buttons.text(
                onPressed: () => Get.back(result: true),
                child: Text(textYes ?? 'Iya'),
              ),
            ],
        actionsAlignment: actionsAlignment ?? MainAxisAlignment.end,
      ),
    );
  }
}
