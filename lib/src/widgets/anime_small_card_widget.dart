import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:anime2_app/src/models/anime_model.dart';

export 'package:anime2_app/src/models/anime_model.dart';

class AnimeSmallCardWidget extends StatelessWidget {

  final String title;
  final String image;
  final Anime anime;

  const AnimeSmallCardWidget({
    this.title, 
    this.image, 
    this.anime
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){ print('${anime.title}'); },
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 100,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('${this.image}'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox( height: 5 ),
        Text('${this.title}', style: GoogleFonts.abel( color: Colors.white), overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}