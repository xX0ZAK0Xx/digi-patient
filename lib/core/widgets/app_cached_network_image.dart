import 'package:cached_network_image/cached_network_image.dart';
import 'package:digi_patient/core/sizes.dart';
import 'package:flutter/material.dart';

import '../images.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({super.key, required this.url, this.height, this.width, this.isPerson = false, this.radius});
  final String url;
  final double? height, width, radius;
  final bool isPerson;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height ?? AppSizes.height(context, 100),
      width: width ?? AppSizes.width(context, 100),
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(
        height: height ?? AppSizes.height(context, 100),
        width: width ?? AppSizes.width(context, 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppSizes.radiusBig),
          image: DecorationImage(image: isPerson ? const AssetImage(AppImages.noImageUser) : const AssetImage(AppImages.noImage), fit: BoxFit.cover)
        ),
      ),
      errorWidget: (_, __, ___) => Container(
        height: height ?? AppSizes.height(context, 100),
        width: width ?? AppSizes.width(context, 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppSizes.radiusBig),
          image: DecorationImage(image: isPerson ? const AssetImage(AppImages.noImageUser) : const AssetImage(AppImages.noImage), fit: BoxFit.cover)
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        height: height ?? AppSizes.height(context, 100),
        width: width ?? AppSizes.width(context, 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? AppSizes.radiusBig),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
        ),
      ),
    );
  }
}