import 'package:flutter/widgets.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class TextHelper {
  static AutoSizeText buildRichText({
    required String text,
    required String highlight,
    required TextStyle highlightStyle,
    TextStyle? defaultStyle,
    TextAlign? textAlign,
  }) {
    List<TextSpan> spans = [];
    int start = 0;
    int indexOfHighlight;

    while ((indexOfHighlight = text.indexOf(highlight, start)) != -1) {
      // Add text before the highlight text
      if (indexOfHighlight > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, indexOfHighlight),
            style: defaultStyle,
          ),
        );
      }

      // Add the highlight text
      spans.add(
        TextSpan(
          text: highlight,
          style: highlightStyle,
        ),
      );

      // Move the start point
      start = indexOfHighlight + highlight.length;
    }

    // Add the remaining text
    if (start < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(start),
          style: defaultStyle,
        ),
      );
    }

    return AutoSizeText.rich(
      TextSpan(children: spans),
      style: defaultStyle,
      textAlign: textAlign,
    );
  }

  static AutoSizeText buildRichMultiText({
    required String text,
    required List<String> highlights,
    required TextStyle highlightStyle,
    TextStyle? defaultStyle,
    TextAlign? textAlign,
    double? maxFontSize,
  }) {
    List<TextSpan> spans = [];
    int start = 0;

    // Sort highlights by length in descending order to handle overlapping highlights better
    highlights.sort((a, b) => b.length.compareTo(a.length));

    // Process the entire text and find highlights
    while (start < text.length) {
      int closestHighlightIndex = text.length;
      String? closestHighlight;

      // Find the closest highlight in the remaining text
      for (String highlight in highlights) {
        int index = text.indexOf(highlight, start);
        if (index != -1 && index < closestHighlightIndex) {
          closestHighlightIndex = index;
          closestHighlight = highlight;
        }
      }

      // If no more highlights found, add remaining text and break
      if (closestHighlight == null) {
        spans.add(
          TextSpan(
            text: text.substring(start),
            style: defaultStyle,
          ),
        );
        break;
      }

      // Add text before the highlight
      if (closestHighlightIndex > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, closestHighlightIndex),
            style: defaultStyle,
          ),
        );
      }

      // Add the highlight text
      spans.add(
        TextSpan(
          text: closestHighlight,
          style: highlightStyle,
        ),
      );

      // Move the start point past the highlight
      start = closestHighlightIndex + closestHighlight.length;
    }

    return AutoSizeText.rich(
      TextSpan(children: spans),
      style: defaultStyle,
      textAlign: textAlign,
      minFontSize: 2,
      maxFontSize: maxFontSize ?? double.infinity,
    );

    //   return RichText(
    //   text: TextSpan(children: spans, style: defaultStyle),
    //   textAlign: textAlign ?? TextAlign.start,
    // );
  }

  static String? capitalizeEachWords(String? text) {
    if (text == null) return text;
    if (text.isEmpty) return text;
    return text.split(' ').map((word) => word.capitalize).join(' ');
  }

  // format int to rupiah
  static String formatRupiah({
    required num? amount,
    bool isCompact = true,
    bool isUsingSymbol = true,
  }) {
    var formattedAmount = isUsingSymbol ? 'Rp. -' : '-';

    if (amount != null) {
      if (isCompact) {
        formattedAmount = NumberFormat.compactCurrency(
          locale: 'id',
          symbol: isUsingSymbol ? 'Rp. ' : '',
          decimalDigits: 0,
        ).format(amount);
      } else {
        formattedAmount = NumberFormat.currency(
          locale: 'id',
          symbol: isUsingSymbol ? 'Rp. ' : '',
          decimalDigits: 0,
        ).format(amount);
      }
    }
    return formattedAmount;
  }

  static int parseRupiah(String? formattedAmount) {
    if (formattedAmount == null) return 0;

    // Hilangkan simbol "Rp" dan tanda baca lainnya
    final cleanedString = formattedAmount.replaceAll(RegExp(r'[^0-9]'), '');

    // Konversi ke int
    return int.tryParse(cleanedString) ?? 0;
  }

  static String formatNumberPhone(String phoneNumber) {
    if (phoneNumber.startsWith('08')) {
      return '+62${phoneNumber.substring(1)}';
    } else {
      return phoneNumber;
    }
  }

  static String formatNumber(num? number) {
    if (number == null) return '-';

    return NumberFormat.compact(locale: 'id').format(number);
  }

  static String replacePrefixText({
    required String prefix,
    required String? value,
    required String? replaceValue,
  }) {
    if (value == null) return '-';
    if (replaceValue == null) return '-';
    return replaceValue.replaceFirst(prefix, value);
  }
}
