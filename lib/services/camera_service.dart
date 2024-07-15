import 'dart:io';

import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class CameraService {
  static Future<String?> takePhoto() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      File fileTemp = File(pickedImage.path);
      img.Image? image = decodeImage(fileTemp.readAsBytesSync());
      img.Image? resizedImage = copyResize(image!, width: 600, height: 800);
      Directory tempDir = await getTemporaryDirectory();
      File fileResult = File('${tempDir.path}/${pickedImage.name}')
        ..writeAsBytesSync(encodeJpg(resizedImage, quality: 70));

      final imagePath = fileResult.path.toString();
      return imagePath;
    }
    return null;
  }
}
