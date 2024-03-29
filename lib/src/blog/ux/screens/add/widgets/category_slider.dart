part of 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({super.key});

  @override
  Widget build(BuildContext context) {
    log('build', name: '$runtimeType');
    final state = Get.find<AddBlogScreenState>();
    return SizedBox(
      height: context.height * .05,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          final category = state.categories[index];
          return Obx(() {
            return Material(
              borderRadius: BorderRadius.circular(Dimens.nano),
              color: state.categoryIndex() == index
                  ? Palette.borderColor
                  : Palette.backgroundColor,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.borderColor),
                  borderRadius: BorderRadius.circular(Dimens.nano),
                ),
                width: context.width * .3,
                child: InkWell(
                  // splashColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(Dimens.nano),
                  onTap: () => state.onCategoryChanged(index),
                  child: Center(child: Text(category)),
                ),
              ),
            );
          });
        },
        separatorBuilder: (context, index) =>
            const SizedBox(width: Dimens.nano),
      ),
    );
  }
}
