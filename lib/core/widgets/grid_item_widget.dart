import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:otaku_scope/core/utils/enums.dart';


class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    required this.imageUrl,
    required this.title,
    required this.id,
    this.mediaType = MediaType.anime,
    super.key,
  });
  final String? imageUrl;
  final String? title;
  final int id;
  final MediaType mediaType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final route = mediaType == MediaType.anime ? '/anime/$id' : '/manga/$id';
        context.push(route);
        // Handle item tap
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    fadeOutDuration: const Duration(milliseconds: 100),
                      imageUrl: imageUrl?.isNotEmpty == true
                          ? imageUrl!
                          : "https://via.placeholder.com/150",
                      placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.grey[200],
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.broken_image, color: Colors.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            
            const SizedBox(height: 6.0),
            Text(
              title ?? 'Anime Title',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
