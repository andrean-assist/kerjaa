import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ConstantsConnect {
  static final endPointBaseUrl = switch (dotenv.get('APP_ENVIRONMENT')) {
    'production' => 'https://api-kerjaa.assist.id/api/',
    'development' => 'https://api-dev-hadir.assist.id/api/',
    'local' => 'http://192.168.1.129:3100/api/',
    _ => 'https://api-dev-hadir.assist.id/api/'
  };

  static final endPointBaseUrlUpload = switch (dotenv.get('APP_ENVIRONMENT')) {
    'production' => 'https://api-image.assist.id/kerjaa/',
    'development' => 'https://api-new-image.assist.id/',
    'local' => 'http://192.168.1.129:3100/api/',
    _ => 'https://api-new-image.assist.id/'
  };

  static final endPointBaseUrlImage = switch (dotenv.get('APP_ENVIRONMENT')) {
    'production' => 'https://kerjaa-medicaboo.s3.ap-southeast-3.amazonaws.com/',
    'development' =>
      'https://dev-upload-file-medicaboo.s3.ap-southeast-1.amazonaws.com/',
    'local' => 'http://192.168.1.129:3100/api/',
    _ => 'https://kerjaa-medicaboo.s3.ap-southeast-3.amazonaws.com/'
  };

  static final bucketUpload = switch (dotenv.get('APP_ENVIRONMENT')) {
    'production' => 'image',
    'development' => 'hospitalImageTest',
    'local' => 'http://192.168.1.129:3100/api/',
    _ => 'hospitalImageTest'
  };
}
