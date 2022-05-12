class GalleryItem {
  final String id;
  String resource;
  final bool isSvg;

  GalleryItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });
}
