import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buttons/buttons.dart';

abstract class Modals {
  static Future<dynamic> bottomSheetWithClose({
    required BuildContext context,
    BoxConstraints? constraints,
    bool useSafeArea = true,
    bool enableDrag = true,
    // bool showDragHandle = true,
    bool isDismissible = false,
    bool isScrollControlled = true,
    required Widget content,
    Widget? actions,
    bool isAction = false,
    String startActionText = 'Tutup',
    String endActionText = 'Simpan',
    VoidCallback? startOnPressed,
    VoidCallback? endOnPressed,
    VoidCallback? onClosePressed,
  }) {
    Widget widgetActions;

    if (actions != null) {
      widgetActions = Column(
        children: [
          const SizedBox(height: 8),
          actions,
          const SizedBox(height: 21),
        ],
      );
    } else if (isAction) {
      widgetActions = Column(
        children: [
          const SizedBox(height: 21),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Buttons.outlined(
                    onPressed: startOnPressed ?? () => Get.back(result: false),
                    child: Text(startActionText),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Buttons.filled(
                    onPressed: endOnPressed ?? () => Get.back(result: true),
                    child: Text(endActionText),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
        ],
      );
    } else {
      widgetActions = const SizedBox.shrink();
    }

    return showModalBottomSheet<bool?>(
      context: context,
      useSafeArea: useSafeArea,
      constraints: constraints,
      enableDrag: enableDrag,
      showDragHandle: false,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton.filled(
              style: ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(context.theme.colorScheme.onSurface),
                backgroundColor:
                    WidgetStatePropertyAll(context.theme.colorScheme.surface),
              ),
              onPressed: onClosePressed ?? Get.back,
              padding: const EdgeInsets.all(16),
              iconSize: 20,
              icon: const Icon(Icons.close_rounded),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: context.mediaQueryViewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                content,
                widgetActions,
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<dynamic> bottomSheet({
    required BuildContext context,
    BoxConstraints? constraints,
    bool useSafeArea = true,
    bool enableDrag = true,
    bool showDragHandle = true,
    bool isDismissible = true,
    bool isScrollControlled = true,
    required Widget content,
    Widget? actions,
    bool isAction = false,
    String startActionText = 'Tutup',
    String endActionText = 'Simpan',
    VoidCallback? startOnPressed,
    VoidCallback? endOnPressed,
    VoidCallback? onClosePressed,
  }) {
    Widget widgetActions;

    if (actions != null) {
      widgetActions = Column(
        children: [
          const SizedBox(height: 8),
          actions,
          const SizedBox(height: 21),
        ],
      );
    } else if (isAction) {
      widgetActions = Column(
        children: [
          const SizedBox(height: 21),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Buttons.outlined(
                    onPressed: startOnPressed ?? () => Get.back(result: false),
                    child: Text(startActionText),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Buttons.filled(
                    onPressed: endOnPressed ?? () => Get.back(result: true),
                    child: Text(endActionText),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
        ],
      );
    } else {
      widgetActions = const SizedBox.shrink();
    }

    return showModalBottomSheet<bool?>(
      context: context,
      useSafeArea: useSafeArea,
      constraints: constraints,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      // backgroundColor: SharedTheme.whiteColor,
      builder: (context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: context.mediaQueryViewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            content,
            widgetActions,
          ],
        ),
      ),
    );
  }

  static Future<bool?> bottomSheetWithCloseScroll({
    required BuildContext context,
    bool useSafeArea = true,
    // bool enableDrag = true,
    // bool showDragHandle = true,
    bool isDismissible = true,
    bool isScrollControlled = true,
    double initialChildSize = 0.25,
    double minChildSize = 0.25,
    double maxChildSize = 1.0,
    bool expand = false,
    bool snap = true,
    List<double> snapSizes = const [0.25, 0.5, 0.75, 1.0],
    required Widget content,
    Widget? actions,
    bool isAction = false,
    String startActionText = 'Tutup',
    String endActionText = 'Simpan',
    VoidCallback? startOnPressed,
    VoidCallback? endOnPressed,
    VoidCallback? onClosePressed,
  }) {
    Widget widgetActions;

    if (actions != null) {
      widgetActions = actions;
    } else if (isAction) {
      widgetActions = Column(
        children: [
          const SizedBox(height: 21),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Buttons.outlined(
                    onPressed: startOnPressed ?? () => Get.back(result: false),
                    child: Text(startActionText),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Buttons.filled(
                    onPressed: endOnPressed ?? () => Get.back(result: true),
                    child: Text(endActionText),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
        ],
      );
    } else {
      widgetActions = const SizedBox.shrink();
    }

    return showModalBottomSheet<bool?>(
      context: context,
      useSafeArea: useSafeArea,
      enableDrag: true,
      showDragHandle: false,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: expand,
          snap: snap,
          snapSizes: snapSizes,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: IconButton.filled(
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                            context.theme.colorScheme.onSurface),
                        backgroundColor: WidgetStatePropertyAll(
                            context.theme.colorScheme.surface),
                      ),
                      onPressed: onClosePressed ?? Get.back,
                      padding: const EdgeInsets.all(16),
                      iconSize: 20,
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    height: context.height,
                    // margin: EdgeInsets.only(
                    //   bottom: MediaQuery.of(context).viewInsets.bottom,
                    // ),
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        content,
                        widgetActions,
                      ],
                    ),
                  ),
                ],
              ),
            );

            // return SingleChildScrollView(
            //   controller: scrollController,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       content,
            //       widgetActions,
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
