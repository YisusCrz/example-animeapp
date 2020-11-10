import 'package:flutter/material.dart';

import 'package:anime2_app/src/providers/anime_provider.dart';

import 'package:anime2_app/src/widgets/anime_big_slider_widget.dart';
import 'package:anime2_app/src/widgets/anime_small_slider_widget.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePageMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff373a40),
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Color(0xffff9a00),
        title: Text('Anime App', style: GoogleFonts.righteous(),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBigSwiper( 1,1 ),
            SizedBox(height: 20),
            _buildSmallSlider( 1, 2, 'Acción' ),
            _buildSmallSlider( 1, 3, 'Aventura' ),
            _buildSmallSlider( 1, 6, 'Comedia' ),
            _buildSmallSlider( 2, 1, 'Comedia' ),
          ],
        ),
      )
   );
  }
}

Widget _buildBigSwiper( int page1, int page2 ){
  return FutureBuilder(
    future: animeProvider.getAnimes(page1, page2),
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      if( snapshot.hasData){
        return AnimeBigSlider( animes: snapshot.data, );
      } else {
        return Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange), )),
        );
      }
    },
  );
}


Widget _buildSmallSlider( int page1, int page2,  String category ){

  return FutureBuilder(
    future: animeProvider.getAnimes(page1, page2),
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      if( snapshot.hasData ){
        return AnimeSmallSlider( animes: snapshot.data, category: category, );
      } else {
        return Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange), )),
        );
      }
    },
  );
}


