import 'package:flutter/material.dart';

import 'package:anime2_app/src/models/anime_model.dart';

class AnimeBigCardWidget extends StatelessWidget {

  final Anime anime;

  const AnimeBigCardWidget({ 
    @required this.anime
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: GestureDetector(
        onTap: (){ print(this.anime.title); },
        child: Container(
          height: 150,
          width: 120,
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage( this.anime.imageUrl ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}