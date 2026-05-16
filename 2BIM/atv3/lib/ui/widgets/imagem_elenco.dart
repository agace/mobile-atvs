import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/tema/tema.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ImagemElenco extends StatelessWidget {
  final String imageUrl;
  final String name;
  const ImagemElenco({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 76,
          height: 78,
          child: getAvatar(),
        ),
        addVerticalSpace( 4),
        Align(
          alignment: Alignment.center,
          child: AutoSizeText(
            name,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget getAvatar() {
    if (imageUrl.isNotEmpty) {
      return CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            imageUrl,
            maxHeight: 76,
            maxWidth: 76,
          ));
    } else {
      return const CircleAvatar(
          backgroundColor: cinzaBotao,
          child: Icon(Icons.person, size: 76.0, color: Colors.black,));
    }
  }
}
