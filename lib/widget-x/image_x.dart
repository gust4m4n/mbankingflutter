import 'dart:io';

import 'all_widgets.dart';

class ImageX extends StatelessWidget {
  final String url;
  final IconData? faIcon;
  final Color? color;
  final BoxFit fit;
  final double width;
  final double height;
  final double cornerRadius;
  final double topLeftRadius;
  final double topRightRadius;
  final Color placeholderColor;
  final String placeholder;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double borderWidth;
  final Color borderColor;

  const ImageX({
    Key? key,
    this.url = '',
    this.faIcon = null,
    this.color,
    this.fit = BoxFit.cover,
    this.width = 64.0,
    this.height = 64.0,
    this.cornerRadius = 0.0,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.placeholderColor = ColorX.transparent,
    this.placeholder = '',
    this.backgroundColor = ColorX.transparent,
    this.padding = const EdgeInsets.all(0.0),
    this.borderWidth = 0.0,
    this.borderColor = ColorX.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.trim().toLowerCase().startsWith('http://') ||
        url.trim().toLowerCase().startsWith('https://')) {
      return ContainerX(
          padding: padding,
          backgroundColor: backgroundColor,
          borderWidth: borderWidth,
          borderColor: borderColor,
          cornerRadius: cornerRadius + borderWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            child: url.isNotEmpty
                ? imageNetwork(context)
                : imagePlaceholder(context),
          ));
    } else if (url.trim().toLowerCase().startsWith('file:')) {
      return ContainerX(
          padding: padding,
          backgroundColor: backgroundColor,
          borderWidth: borderWidth,
          borderColor: borderColor,
          cornerRadius: cornerRadius + borderWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            child:
                url.isNotEmpty ? imageFile(context) : imagePlaceholder(context),
          ));
    } else {
      return ContainerX(
          padding: padding,
          backgroundColor: backgroundColor,
          borderWidth: borderWidth,
          borderColor: borderColor,
          cornerRadius: cornerRadius + borderWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            child: url.isNotEmpty
                ? url.startsWith('/')
                    ? imageFile(context)
                    : imageAsset(context, url)
                : faIcon != null
                    ? imageAwesome(context, faIcon!)
                    : imagePlaceholder(context),
          ));
    }
  }

  Widget imagePlaceholder(BuildContext context) {
    if (placeholder.isNotEmpty) {
      return imageAsset(context, placeholder);
    } else {
      return Container(
          width: width - (padding.left + padding.right),
          height: height - (padding.top + padding.bottom),
          color: placeholderColor);
    }
  }

  Widget imageNetwork(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url.trim(),
        color: color,
        width: width - (padding.left + padding.right),
        height: height - (padding.top + padding.bottom),
        fit: fit,
        fadeInDuration: const Duration(milliseconds: 0),
        fadeOutDuration: const Duration(milliseconds: 0),
        placeholder: (context, url) => imagePlaceholder(context),
        placeholderFadeInDuration: const Duration(milliseconds: 0),
        errorWidget: (context, url, error) => imagePlaceholder(context));
  }

  Widget imageFile(BuildContext context) {
    var localPath = url.trim();
    const prefixLen = 'file:'.length;
    if (localPath.startsWith('file:')) {
      localPath = localPath.substring(prefixLen, localPath.length);
    }
    return Image.file(File(localPath),
        color: color,
        width: width - (padding.left + padding.right),
        height: height - (padding.top + padding.bottom),
        fit: fit, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
      return imagePlaceholder(context);
    });
  }

  Widget imageAsset(BuildContext context, String name) {
    if (name.trim().toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(name,
          width: width - (padding.left + padding.right),
          height: height - (padding.top + padding.bottom),
          fit: fit,
          colorFilter: ColorFilter.mode(
              color != null ? color! : Colors.transparent, BlendMode.srcIn));
    } else {
      return Image(
          image: AssetImage(name.trim()),
          color: color,
          width: width - (padding.left + padding.right),
          height: height - (padding.top + padding.bottom),
          fit: fit,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return imagePlaceholder(context);
          });
    }
  }

  Widget imageAwesome(BuildContext context, IconData icon) {
    return ContainerX(
        width: width - (padding.left + padding.right),
        height: height - (padding.top + padding.bottom),
        child: Center(
            child: FaIcon(
          icon,
          size: width < height
              ? (width - (padding.left + padding.right))
              : (height - (padding.top + padding.bottom)),
          color: color,
        )));
  }
}
