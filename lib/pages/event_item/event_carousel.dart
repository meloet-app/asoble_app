import 'package:asoble_app/models/current_event_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../my_home_page.dart';
import 'event_list.dart';

class EventCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Consumer<EventCarouselModel>(builder: (context, model, child) {
      return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: CarouselSlider(
            items: currentPartyList,
            options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                autoPlayAnimationDuration: Duration(milliseconds: 1200),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  model.changeEventCarousel(index);
                  MyHomePage.carouselIndex = index;
                }
                )
        ),
      );
    });
  }
}
