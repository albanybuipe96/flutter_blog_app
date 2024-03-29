part of 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';

class ImageUploader extends StatelessWidget {
  const ImageUploader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Get.find<AddBlogScreenState>();
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeCap: StrokeCap.round,
      color: Palette.borderColor,
      strokeWidth: .5,
      radius: const Radius.circular(Dimens.nano),
      dashPattern: const [20, 3],
      child: SizedBox(
        height: Dimens.mega,
        width: context.width,
        child: GestureDetector(
          onTap: state.pickImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return state.imageUrl() == null
                    ? const Icon(
                        EvaIcons.folderOutline,
                        size: Dimens.meso,
                      )
                    : Image.file(
                        File(state.imageUrl()!),
                        width: Dimens.meso,
                        height: Dimens.meso,
                      );
              }),
              const Gap(Dimens.nano),
              const Text('Upload Image'),
            ],
          ),
        ),
      ),
    );
  }
}
