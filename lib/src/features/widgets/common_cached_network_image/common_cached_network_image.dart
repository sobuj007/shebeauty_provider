import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? borderRadius;
  const CommonCachedNetworkImage({super.key, required this.imageUrl, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 500),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
        const CircularProgressIndicator(),
        errorWidget:
            (context, url, error) =>
        const Icon(
          Icons.hourglass_empty,
          size: 80,
        ),
      ),
    );
  }
}
