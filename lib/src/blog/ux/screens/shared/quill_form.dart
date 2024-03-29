part of 'package:flutter_blog_app/src/blog/ux/screens/add/add_blog_screen.dart';

class QuillForm extends StatelessWidget {
  const QuillForm({required this.readOnly, super.key});

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.nano),
      child: Form(
        child: Column(
          children: [
            if (!readOnly)
              QuillToolbar.simple(
                configurations: QuillConfig(
                  controller: QuillConfig.quillController,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('en'),
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: Dimens.nano),
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.nano,
                  vertical: Dimens.nano,
                ),
                decoration: BoxDecoration(
                    border: readOnly ? Border.all(color: Colors.white38) : null,
                    borderRadius: BorderRadius.circular(Dimens.nano)),
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    controller: QuillConfig.quillController,
                    readOnly: readOnly,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuillConfig extends QuillSimpleToolbarConfigurations {
  const QuillConfig({
    required super.controller,
    super.toolbarSectionSpacing = kToolbarSectionSpacing,
    super.toolbarIconAlignment = WrapAlignment.start,
    super.toolbarIconCrossAlignment = WrapCrossAlignment.start,
    super.fontSizesValues,
    super.showDividers = false,
    super.showFontFamily = true,
    super.showFontSize = false,
    super.showBoldButton = true,
    super.showItalicButton = true,
    super.showSmallButton = false,
    super.showUnderLineButton = true,
    super.showStrikeThrough = true,
    super.showInlineCode = false,
    super.showColorButton = true,
    super.showBackgroundColorButton = false,
    super.showClearFormat = false,
    super.showAlignmentButtons = true,
    super.showLeftAlignment = true,
    super.showCenterAlignment = true,
    super.showRightAlignment = true,
    super.showJustifyAlignment = true,
    super.showHeaderStyle = false,
    super.showListNumbers = false,
    super.showListBullets = true,
    super.showListCheck = false,
    super.showCodeBlock = true,
    super.showQuote = true,
    super.showIndent = false,
    super.showLink = false,
    super.showUndo = true,
    super.showRedo = false,
    super.showDirection = false,
    super.showSearchButton = false,
    super.showSubscript = false,
    super.showSuperscript = false,
    super.sharedConfigurations,
  });

  static final quillController = QuillController.basic();
}

const String jsonString =
    r'[{"insert":"Albany Buipe","attributes":{"bold":true}},{"insert":"\n","attributes":{"align":"center"}},{"insert":"Hello, my name is "},{"insert":"Albany Buipe","attributes":{"bold":true,"font":"nunito"}},{"insert":".\n\nI am a Platform Engineer with Hubtel Ltd.\n\nI program in Dart and "},{"insert":"Flutter","attributes":{"color":"#FF1E88E5"}},{"insert":".\n\nBut professionally I program Native Android in Kotlin because I mostly work on POS Terminal devices and payment processing.\n"},{"insert":"Albany Buipe","attributes":{"bold":true}},{"insert":"\n","attributes":{"align":"center"}},{"insert":"Hello, my name is "},{"insert":"Albany Buipe","attributes":{"bold":true,"font":"nunito"}},{"insert":".\n\nI am a Platform Engineer with Hubtel Ltd.\n\nI program in Dart and "},{"insert":"Flutter","attributes":{"color":"#FF1E88E5"}},{"insert":".\n\nBut professionally I program Native Android in Kotlin because I mostly work on POS Terminal devices and payment processing.\n"},{"insert":"Albany Buipe","attributes":{"bold":true}},{"insert":"\n","attributes":{"align":"center"}},{"insert":"Hello, my name is "},{"insert":"Albany Buipe","attributes":{"bold":true,"font":"nunito"}},{"insert":".\n\nI am a Platform Engineer with Hubtel Ltd.\n\nI program in Dart and "},{"insert":"Flutter","attributes":{"color":"#FF1E88E5"}},{"insert":".\n\nBut professionally I program Native Android in Kotlin because I mostly work on POS Terminal devices and payment processing.\n"},{"insert":"Albany Buipe","attributes":{"bold":true}},{"insert":"\n","attributes":{"align":"center"}},{"insert":"Hello, my name is "},{"insert":"Albany Buipe","attributes":{"bold":true,"font":"nunito"}},{"insert":".\n\nI am a Platform Engineer with Hubtel Ltd.\n\nI program in Dart and "},{"insert":"Flutter","attributes":{"color":"#FF1E88E5"}},{"insert":".\n\nBut professionally I program Native Android in Kotlin because I mostly work on POS Terminal devices and payment processing.\n"},{"insert":"Albany Buipe","attributes":{"bold":true}},{"insert":"\n","attributes":{"align":"center"}},{"insert":"Hello, my name is "},{"insert":"Albany Buipe","attributes":{"bold":true,"font":"nunito"}},{"insert":".\n\nI am a Platform Engineer with Hubtel Ltd.\n\nI program in Dart and "},{"insert":"Flutter","attributes":{"color":"#FF1E88E5"}},{"insert":".\n\nBut professionally I program Native Android in Kotlin because I mostly work on POS Terminal devices and payment processing.\n"},{"insert":"Albany Buipe","attributes":{"bold":true}},{"insert":"\n","attributes":{"align":"center"}},{"insert":"Hello, my name is "},{"insert":"Albany Buipe","attributes":{"bold":true,"font":"nunito"}},{"insert":".\n\nI am a Platform Engineer with Hubtel Ltd.\n\nI program in Dart and "},{"insert":"Flutter","attributes":{"color":"#FF1E88E5"}},{"insert":".\n\nBut professionally I program Native Android in Kotlin because I mostly work on POS Terminal devices and payment processing."},{"insert":"\n","attributes":{"blockquote":true}}]';