



import 'package:asoble_app/models/current_event_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'event_list.dart';

class EventCarousel extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Consumer<EventCarouselModel>(
        builder: (context, model, child) {
          return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [

                    CarouselSlider(
                        items: currentPartyList,
                        options: CarouselOptions(
                            height: mediaSize.height*0.25,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 6),
                            autoPlayAnimationDuration: Duration(
                                milliseconds: 1200),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              model.changeEventCarousel(index);
                            }
                        )
                    ),


                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: currentPartyList.map((widget) {
                        int index = currentPartyList.indexOf(widget);
                        return Container(
                          width: 6.0,
                          height: 6.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: model.selectedEventCarouselIndex == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

              ]);
        });
  }

}