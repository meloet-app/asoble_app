

import 'package:asoble_app/pages/mypages/global_community.dart';
import 'package:asoble_app/pages/mypages/global_friend_list.dart';
import 'package:asoble_app/pages/mypages/inviteParty.dart';
import 'package:asoble_app/pages/mypages/my_profile.dart';
import 'package:flutter/material.dart';

import 'global_event_list.dart';
import 'in_community/community_navigation_bar.dart';
import 'inform_free_page.dart';
import 'my_home_page.dart';

List navigationList =[
      MyHomePage(), //0
      InformFreePage(), //1
      GlobalFriendListPage(), //2
      GlobalEventListPage(), //3
      GlobalCommunityListPage(), //4
      MyProfilePage(), //5
      CommunityNavigationBar(), //6
];

List secondNavigationList =[
      invitePartyPage(),
];