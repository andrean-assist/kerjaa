import 'dart:math';

class FormatFileHelper {
  static String fileSize(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    final i = (bytes == 0) ? 0 : (log(bytes) / log(1024)).floor();
    final size = bytes / pow(1024, i);
    return "${size.toStringAsFixed(decimals)} ${suffixes[i]}";
    // return "\${size.toStringAsFixed(decimals)} \${suffixes[i]}";
  }
}
