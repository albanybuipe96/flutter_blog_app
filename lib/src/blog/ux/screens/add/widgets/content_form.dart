part of 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';

class ContentForm extends StatelessWidget {
  const ContentForm({super.key});

  @override
  Widget build(BuildContext context) {
    log('build', name: '$runtimeType');
    final state = Get.find<AddBlogScreenState>();
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.nano),
        child: Column(
          children: [
            const ImageUploader(),
            const Gap(Dimens.macro),
            const CategorySlider(),
            const Gap(Dimens.macro),
            InputField(
              controller: state.titleController,
              label: 'Title',
              fillColor: Colors.transparent,
              bordered: true,
              borderColor: Palette.borderColor,
            ),
            const Gap(Dimens.macro),
            InputField(
              label: 'Content',
              maxLines: 20,
              fillColor: Colors.transparent,
              controller: state.contentController,
              bordered: true,
              borderColor: Palette.borderColor,
            ),
          ],
        ),
      ),
    );
  }
}
