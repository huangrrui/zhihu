import 'package:flutter/material.dart';

class MainPageHotView extends StatefulWidget {
  @override
  _MainPageHotViewState createState() => _MainPageHotViewState();
}

class _MainPageHotViewState extends State<MainPageHotView> {
  List<_HotModel> modelList = _HotModel.test();

  @override
  void initState() {
    modelList = _HotModel.test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFEFEF),
      child: ListView(
        children: List.generate(10, (i) {
          return Container(
            color: Colors.white,
            child: _CellView(
              model: modelList[i],
              index: i,
            ),
          );
        }),
      ),
    );
  }
}

class _CellView extends StatelessWidget {
  final _HotModel model;
  final int index;

  _CellView({
    this.model,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text(
                      '$index',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              model.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          () {
                            if (model.subTitle == '') {
                              return Container();
                            } else {
                              return Text(
                                model.subTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              );
                            }
                          }(),
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              model.detail,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    width: 95,
                    height: 66,
                    child: Image.asset('assets/images/main_hot/main_hot_pic_$index.png'),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Color(0xFFD2D2D2)),
          ],
        ),
      ),
    );
  }
}

class _HotModel {
  String title;
  String subTitle;
  String detail;
  String imageUrl;

  _HotModel({
    this.title,
    this.subTitle,
    this.detail,
    this.imageUrl,
  });

  _HotModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    detail = json['detail'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['title'] = title;
    json['subTitle'] = subTitle;
    json['detail'] = detail;
    json['imageUrl'] = imageUrl;
    return json;
  }

  static List<_HotModel> test() {
    return [
      _HotModel(
        title: '全国心性肺炎情况怎么样了',
        subTitle: '了解疫情最新进展>>',
        detail: '置顶',
        imageUrl: '',
      ),
      _HotModel(
        title: '为什么说「新型冠状病毒是人造的」不靠谱？',
        subTitle: '',
        detail: '5261 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '有那些是减肥后的翻车现场？',
        subTitle: '很多人都说减完肥就变漂亮变帅，但我相信也不是每个人都会有这种神奇的变化。这种减肥',
        detail: '4453 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '内蒙古出现特殊病例：无外出无接触，但住患者楼上，可能是通过哪些途径感染的？',
        subTitle: '',
        detail: '4427 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '如何看待趁主人被隔离观察，社区将其宠物猫活埋？主人该如何维权？',
        subTitle: '',
        detail: '4415 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '美国首例新冠病毒患者使用未获批药瑞德西韦后大幅好转，它有望成为病毒克星吗？',
        subTitle: '',
        detail: '4404 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '2020 年 2 月 2 日是千年对称日，这一天可以做什么纪念性的活动呢？',
        subTitle: '',
        detail: '2780 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '2 月 1 日全国新型肺炎累计确诊 14380 例，死亡 304 例，目前防治情况怎么样了？',
        subTitle: '',
        detail: '2779 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '如何看待国外亿万富翁无人脉 90 天重新用 100 美元赚到75w？',
        subTitle: '',
        detail: '2070 万热度',
        imageUrl: '',
      ),
      _HotModel(
        title: '5 岁女孩商场撒泼打滚，父亲静看 3 小时，如果你是父亲有什么好办法？',
        subTitle: '',
        detail: '1824 万热度',
        imageUrl: '',
      ),
    ];
  }
}
