import 'package:flutter/material.dart';

import 'package:anime2_app/src/pages/desktop/home_page_desktop.dart';
import 'package:anime2_app/src/pages/mobile/home_page_mobile.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if( constraints.maxWidth > 1200 ){
          return HomePageDesktop();
        } else if ( constraints.minWidth > 800 && constraints.maxWidth < 1200 ){
          return HomePageDesktop();
        } else {
          return HomePageMobile();
        }
      },
    );
  }
}