import 'package:assist_hadir/app/modules/overtime/screen/assigned_overtime_screen_view.dart';
import 'package:assist_hadir/app/modules/overtime/screen/submission_overtime_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/card/cards.dart';
import '../controllers/overtime_controller.dart';

class OvertimeView extends GetView<OvertimeController> {
  const OvertimeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lembur'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              const Divider(
                height: 1.0,
                color: SharedTheme.dividerColor,
              ),
              Cards.filled(
                context: context,
                inPadding: const EdgeInsets.all(8),
                outPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
                color: SharedTheme.whiteColor,
                child: ObxValue(
                  (state) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 8,
                    children: [
                      _builderCustomTab(
                        isActive: state.value == 0,
                        text: 'Pengajuan',
                        onPressed: () => controller.changeScreen(0),
                      ),
                      _builderCustomTab(
                        isActive: state.value == 1,
                        text: 'Ditugaskan',
                        onPressed: () => controller.changeScreen(1),
                      ),
                    ],
                  ),
                  controller.currentScreen,
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabC,
        children: const [
          SubmissionOvertimeScreen(),
          AssignedOvertimeScreenView(),
        ],
      ),
    );
  }

  Widget _builderCustomTab({
    required bool isActive,
    required String text,
    required VoidCallback onPressed,
  }) {
    if (isActive) {
      return Expanded(
        child: Buttons.filledTonal(
          width: double.infinity,
          style: FilledButton.styleFrom(
            backgroundColor: SharedTheme.filledTonalBtnColor,
            foregroundColor: SharedTheme.textBtnColor,
            side: const BorderSide(
              color: SharedTheme.outlinedBtnColor,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            textStyle: const TextStyle(
              fontWeight: SharedTheme.semiBold,
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
    } else {
      return Expanded(
        child: Buttons.text(
          width: double.infinity,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            textStyle: const TextStyle(
              fontWeight: SharedTheme.semiBold,
            ),
            foregroundColor: SharedTheme.disabledColor,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
    }
  }

}
