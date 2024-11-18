import 'package:get/get.dart';

abstract class Validation {
  static String? formField({
    required String titleField,
    required String? value,
    bool isRequired = true,
    bool? isNumericOnly,
    bool? isEmail,
    bool? isNotZero,
    num? minLengthChar,
    num? maxLengthChar,
    int? minLength = 0,
    int? maxLength,
    // RangeModel? range,
    String? messageEmpty,
    String? messageNotZero,
    String? messageMinChar,
    String? messageMaxChar,
    String? messageMinLength,
    String? messageMaxLength,
  }) {
    // jika wajib diisi maka
    if (isRequired) {
      // print('value = $value');

      if (value?.isEmpty ?? true) {
        return '$titleField harus di isi!';
      }
    }

    // jika tidak wajib diisi maka
    if (value != null && value.isNotEmpty) {
      if (isNumericOnly ?? false) {
        if (!value.isNumericOnly) {
          return messageEmpty ?? 'Inputan $titleField harus berupa angka!';
        }

        if (isNotZero ?? false) {
          if (int.parse(value) == 0) {
            return messageNotZero ?? 'Nilai field harus lebih dari 0';
          }

          if (int.parse(value) < minLength!) {
            return messageMinLength ?? '$titleField tidak boleh kurang dari 0';
          }

          if (maxLength != null) {
            if (int.parse(value) > maxLength) {
              return messageMinLength ??
                  '$titleField tidak boleh lebih dari $maxLength';
            }
          }
        }

        // if (!isPhoneNumber && value.startsWith('0')) {
        //   return 'Format penulisan angka salah, tidak boleh menambahkan angka 0 di depan';
        // }

        // if (range != null) {
        //   final minRange = range.minRange;
        //   final maxRange = range.maxRange;
        //   final typeRange = range.type;

        //   if (int.parse(value) < minRange) {
        //     return '$titleField kurang rentang ($minRange - $maxRange $typeRange)';
        //   }

        //   if (int.parse(value) > maxRange) {
        //     return '$titleField melebihi rentang ($minRange - $maxRange $typeRange)';
        //   }
        // }
      } else {
        // jika bukan angka
        if (isEmail ?? false) {
          if (!value.isEmail) {
            return 'Format $titleField tidak sesuai';
          }
        }

        if (value.length.isLowerThan(minLengthChar ?? 0)) {
          return messageMinChar ??
              '$titleField minimal harus $minLengthChar karakter!';
        }

        if (maxLengthChar != null &&
            value.length.isGreaterThan(maxLengthChar)) {
          return messageMaxChar ??
              '$titleField melewati maksimal $maxLengthChar karakter';
        }
      }
    }

    return null;
  }
}
