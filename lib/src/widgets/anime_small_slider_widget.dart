import 'package:flutter/material.dart';

import 'package:anime2_app/src/widgets/anime_small_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeSmallSlider extends StatelessWidget {

  final List<Anime> animes;
  final String category;

  const AnimeSmallSlider({ 
    @required this.animes, 
    @required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric( horizontal: 18.0, vertical: 10.0 ),
          child: Text(this.category, style: GoogleFonts.righteous( color: Colors.white, fontSize: 15 ),),
        ),
        Container(
          child: CarouselSlider.builder(
            itemCount: animes.length, 
            options: CarouselOptions(
              scrollPhysics: BouncingScrollPhysics(),
              enableInfiniteScroll: true,
              height: 140,
              initialPage: 2,
              pageSnapping: false,
              viewportFraction: 0.2,
              enlargeCenterPage: false,
            ),
            itemBuilder: (context, index) {
              return AnimeSmallCardWidget(
                title: animes[index].title,
                image: animes[index].imageUrl,
                anime: animes[index],
              );
            }, 
          ),
        ),
        SizedBox( height: 10 ),
      ],
    );
  }
}
