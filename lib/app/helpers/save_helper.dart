import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

abstract class SaveHelper {
  static Future<String?> getSavePath(String fileName) async {
    // final directory =
    //     await getApplicationDocumentsDirectory(); // Dapatkan direktori aplikasi

    try {
      final directory =
          await getApplicationCacheDirectory(); // Dapatkan direktori sementara

      print('directory = $directory');
      print('is directory exist = ${directory.existsSync()}');

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final savePath =
          '${directory.path}/$fileName.jpg'; // Gabungkan dengan nama file
      return savePath;
    } catch (e) {
      Logger().e('Error: getSavePath = $e');
    }

    return null;
  }
}
