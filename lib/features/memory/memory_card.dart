class MemoryCard {
  final String imagePath;
  final bool matched;
  final int? index;

  const MemoryCard(
      {required this.imagePath, required this.matched, this.index});

  MemoryCard copyWith({String? imagePath, bool? matched, int? index}) {
    return MemoryCard(
        imagePath: imagePath ?? this.imagePath,
        matched: matched ?? this.matched,
        index: index ?? this.index);
  }
}
