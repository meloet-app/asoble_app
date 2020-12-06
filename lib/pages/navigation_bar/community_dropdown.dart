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
          return
            Padding(
              padding: const EdgeInsets.only(left:40),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: mediaSize.width-240,
                          child: Center(
                              child: Text(
                                CommunityDisplayList[model.selectedCommunityIndex],
                                overflow: TextOverflow.ellipsis,))),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 40,),
                        onPressed: (){showDialog(
                          context: context,
                          builder: (_) {
                            return CommunityDropdownDialog(
                              context: context,
                            );
                          },
                        );}
                      )
                    ],
                  )

          ),
            );
    });
}}


class CommunityDropdownDialog extends StatelessWidget{

  BuildContext context;
  CommunityDropdownDialog({this.context});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title:Text("コミュニティを選んでください"),
      children:[
        CommunityList(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              color: Colors.grey,
                onPressed:()  {
                Navigator.pop(context);
                context.read<SelectCommunityModel>().changeCommunityBackButton();  //　ラグで見栄えが悪いため決定ボタンと逆にする（ async??）
                },
                child: Text("戻る")),
            FlatButton(
              color: Colors.blue,
                onPressed:(){
                  context.read<SelectCommunityModel>().changeCommunity();  //外からmodelを変更する
                Navigator.pop(context);},
                child: Text("決定")),
          ],
        )
      ]
    );
  }

  Widget CommunityList(){
    List<Widget> _communityList = new List<Widget>();


    for (var i = 0; i < CommunityDisplayList.length; i++) {  //コミュニティリストの長さ分だけループ、
      _communityList.add(

          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Consumer<SelectCommunityModel>(
              builder: (context, model, child) {
          return SimpleDialogOption(
                  onPressed: ()=>model.wkChangeCommunity(i),   //i番目のコミュニティに触れたときmodel.selectedCommunityIndexをi番目に変更
                  child: Text(         //class:ダイアログテキストをリストに追加
                    CommunityDisplayList[i],
                      style: TextStyle(
                        fontWeight:
                        i==model.wkSelectedCommunityIndex?  //model.selected〜がiと一致したらそれは選択されているコミュニティ=>太字表示
                        FontWeight.bold:
                        FontWeight.normal),
                  ),

      );})
            ),
          ),
          );
    }
    return Column(
      children: _communityList,
    );
  }
}


