import 'package:flutter/material.dart';

import 'package:anime2_app/src/models/anime_model.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:anime2_app/src/widgets/anime_big_card_widget.dart';

class AnimeBigSlider extends StatelessWidget {

  final List<Anime> animes;

  const AnimeBigSlider({
    @required this.animes,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: animes.length, 
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.3,
        initialPage: 2,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      itemBuilder: (context, index) {
        return AnimeBigCardWidget( anime: animes[index], );
      }, 
    );
  }
}