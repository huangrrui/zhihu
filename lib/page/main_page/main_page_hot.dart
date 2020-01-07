import 'package:flutter/material.dart';

class MainPageHot extends StatefulWidget {
  @override
  _MainPageHotState createState() => _MainPageHotState();
}

class _MainPageHotState extends State<MainPageHot> {
  List<HotModel> list = [];

  @override
  void initState() {
    list = HotModel.test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _titleView(),
        Expanded(
          child: ListView(),
        ),
      ],
    );
  }

  Widget _titleView() {
    return Container(
      height: 44,
    );
  }

  Widget _cellView() {
    return Container();
  }
}

class HotModel {
  String title;
  String subTitle;
  String imageUrl;

  HotModel({
    this.title,
    this.subTitle,
    this.imageUrl,
});

  HotModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['title'] = title;
    json['subTitle'] = subTitle;
    json['imageUrl'] = imageUrl;
  }

  static test() {
    return List.generate(10, (i) {
      return HotModel(
        title: '大标题$i',
        subTitle: '小标题小标题小标题小标题小标题小标题小标题',
        imageUrl: '',
      );
    });
  }
}
