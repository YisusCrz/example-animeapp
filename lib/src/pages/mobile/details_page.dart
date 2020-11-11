import 'package:flutter/material.dart';

import 'package:anime2_app/src/models/anime_model.dart';
import 'package:google_fonts/google_fonts.dart';


class MobileDetailsPage extends StatelessWidget {

  final Anime anime;

  const MobileDetailsPage({
    @required this.anime
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff373a40),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 20 ),
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 20.0 ),
                  child: Row(
                    children: [
                      Expanded(child: Text(this.anime.title, style: GoogleFonts.righteous( color: Colors.white, fontSize: 25,))),
                      Icon(Icons.star_rate, color: Colors.yellow,),
                      SizedBox( width: 10 ),
                      Container(
                        child: Text(('${this.anime.score}'), style: GoogleFonts.righteous( color: Colors.white, fontSize: 25),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  child: Row(
                    children: [
                      Icon(Icons.movie, color: Colors.white,),
                      SizedBox( width: 10 ),
                      Text(('Episodes: ${this.anime.episodes}'), style: GoogleFonts.abel( color: Colors.white, fontSize: 20 ),),
                    ],
                  )
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 20 ),
                  child: Text(this.anime.synopsis, style: GoogleFonts.abel( color: Colors.white, fontSize: 20 ),)
                ),
                SizedBox( height: 30 )
              ]
            ),
          ),
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Color(0xffff9a00),
        onPressed: (){},
      ),
   );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Color(0xffff9a00),
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Hero(
          tag: this.anime.title,
          child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('${this.anime.imageUrl}'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}