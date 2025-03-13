import 'package:flutter/material.dart';

import '../../activity_history/widgets/modals/custom_date_activity_history_modal.dart';
import '../../widgets/modal/modals.dart';

class BuilderFilterChips extends StatelessWidget {
  final List<String> filters;

  const BuilderFilterChips(this.filters, {super.key});

  @override
  Widget build(BuildContext context) {
    return _builderFilterChips(context);
  }

  Widget _builderFilterChips(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters
            .map((e) => _builderItemChip(context: context, text: e))
            .toList(),
      ),
    );
  }

  Widget _builderItemChip({
    required BuildContext context,
    required String text,
  }) {
    final index = filters.indexOf(text);
    return Container(
      margin: EdgeInsets.only(
        left: (index == 0) ? 12 : 0,
        right: 12,
      ),
      child: InputChip(
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        // selected: isSelected,
        // color: WidgetStatePropertyAll(
        //   isSelected ? const Color(0xFFEBF5FB) : SharedTheme.whiteColor,
        // ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFE2E8F0),
            // color:
            //     isSelected ? const Color(0xFFCBD5E1) : const Color(0xFFE2E8F0),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        deleteIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        onSelected: (_) {},
        onDeleted: () {},
        showCheckmark: false,
      ),
      // child: Obx(
      //   () {
      //     final selectedFilter = controller.selectedFilter.value;
      //     final isSelected = index == selectedFilter;

      //     return InputChip(
      //       label: Text(
      //         text,
      //         style: const TextStyle(
      //           color: Colors.black,
      //         ),
      //       ),
      //       selected: isSelected,
      //       color: WidgetStatePropertyAll(
      //         isSelected ? const Color(0xFFEBF5FB) : SharedTheme.whiteColor,
      //       ),
      //       shape: RoundedRectangleBorder(
      //         side: BorderSide(
      //           width: 1,
      //           color: isSelected
      //               ? const Color(0xFFCBD5E1)
      //               : const Color(0xFFE2E8F0),
      //         ),
      //         borderRadius: BorderRadius.circular(100),
      //       ),
      //       deleteIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      //       onSelected: (_) async {
      //         controller.setFilter(index);

      //         if (index == 2) {
      //           _showModal(context);
      //         }
      //       },
      //       onDeleted: () {},
      //       showCheckmark: false,
      //     );
      //   },
      // ),
    );
  }

  void _showModal(BuildContext context) {
    Modals.bottomSheetWithClose(
      context: context,
      enableDrag: true,
      isDismissible: false,
      content: const CustomDateActivityHistoryModal(),
    );
  }
}
