import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../utils/app_colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const CustomCachedNetworkImage({super.key, required this.imageUrl});

  bool _isValidUrl(String url) {
    final Uri? uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme("http") || uri.isScheme("https"));
  }

  @override
  Widget build(BuildContext context) {
    // Validate the image URL
    if (!_isValidUrl(imageUrl)) {
      return const Center(
        child: Icon(
          Icons.error_outline,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator(value: downloadProgress.progress)
            : const CupertinoActivityIndicator(
                color: AppColors.purpleColor,
              ),
      ),
      errorWidget: (context, url, error) {
        DefaultCacheManager().removeFile(url);
        return const Center(
          child: Icon(
            Icons.error_outline,
          ),
        );
      },
      fit: BoxFit.fill,
    );
  }
}
