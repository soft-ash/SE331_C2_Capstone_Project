class OnboardingItemModel {
  final int index;
  final String titlePart1Key;
  final String titlePart2Key;
  final String titleHighlightKey;
  final bool hasUnderlineAccent;
  final String descriptionKey;
  final String imagePath;
  final bool isImageAtBottom;
  final bool showLogo;

  const OnboardingItemModel({
    required this.index,
    required this.titlePart1Key,
    this.titlePart2Key = '',
    required this.titleHighlightKey,
    this.hasUnderlineAccent = false,
    required this.descriptionKey,
    required this.imagePath,
    required this.isImageAtBottom,
    this.showLogo = false,
  });
}
