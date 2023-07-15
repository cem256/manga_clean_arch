import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    super.key,
    this.height,
    this.errorWidget,
    this.placeholder,
    this.fit,
  });

  final double? height;
  final String imageUrl;
  final Widget? errorWidget;
  final Widget? placeholder;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
      placeholder: (context, url) => Center(child: placeholder ?? const CircularProgressIndicator.adaptive()),
      fit: fit,
    );
  }
}
