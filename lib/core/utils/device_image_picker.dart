import 'package:image_picker/image_picker.dart';

mixin class DeviceImagePicker {
  final _picker = ImagePicker();

  Future<String?> pickImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    return image.path;
  }

  Future<String?> takeImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);

    if (image == null) return null;
    return image.path;
  }
}
