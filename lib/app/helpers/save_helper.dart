import 'package:path_provider/path_provider.dart';

abstract class SaveHelper {
  static Future<String> getSavePath(String fileName) async {
    final directory =
        await getApplicationDocumentsDirectory(); // Dapatkan direktori aplikasi
    final savePath =
        '${directory.path}/$fileName.jpg'; // Gabungkan dengan nama file
    return savePath;
  }
}
