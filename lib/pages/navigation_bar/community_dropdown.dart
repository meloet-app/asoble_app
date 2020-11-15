

import 'package:asoble_app/models/select_community_model.dart';
import 'package:asoble_app/setup/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_home_page.dart';

class CommunityDropdown extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectCommunityModel>(
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.only(left:40.0),
            child: Container(

              child: DropdownButton<String>(
                underline:  Container(
                  height: 0,
                  color: Colors.white,
                ),
                iconEnabledColor: Colors.white,
                iconSize:40,
                autofocus: true,



                value: CommunityDisplayList[model.selectedCommunityIndex],
                onChanged:(String newValue){
                  model.changeCommunity(newValue);
                },
                selectedItemBuilder: (context) {
                  return CommunityDisplayList.map((String item) {
                    return Center(
                      child: Container(
                        width: mediaSize.width*0.35,


                            child: Text(
                              item,
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis

                            ),

                      ),
                    );
                  }).toList();
                },
                items: CommunityDisplayList.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: item == CommunityDisplayList[model.selectedCommunityIndex]
                          ? TextStyle(fontWeight: FontWeight.bold)
                          : TextStyle(fontWeight: FontWeight.normal),
                    ),
                  );
                }).toList(),
              ),
            ),
          );

    });



}}