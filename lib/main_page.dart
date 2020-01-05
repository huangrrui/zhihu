import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static String rName = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController controller;

  bool isExpanded = false; // 关注按钮下方的View
  AnimationController expandAnim; // 展开关注按钮下方View的动画

  @override
  void initState() {
    controller = TabController(
      length: 3,
      vsync: this,
    );
    expandAnim = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    expandAnim.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: <Widget>[
                Tab(
                  child: GestureDetector(
                    onTap: () {
                      controller.animateTo(0);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: <Widget>[
                          Text('关注'),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                                if (isExpanded == true) {
                                  expandAnim.forward();
                                } else {
                                  expandAnim.reverse();
                                }
                              });
                            },
                            child: isExpanded == true ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                ),
                Tab(text: '推荐'),
                Tab(text: '热榜'),
              ],
              controller: controller,
              labelColor: Colors.black,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    children: <Widget>[
                      Container(color: Colors.blue),
                      Container(color: Colors.green),
                      Container(color: Colors.red),
                    ],
                    controller: controller,
                  ),
                  _expandView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Row(
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              color: Colors.white,
              height: 44,
            ),
          ),
          Container(
            width: 44,
            height: 44,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _expandView() {
    return Column(
      children: <Widget>[
        Container(
          height: 64.0 * expandAnim.value,
          color: Colors.amber,
          child: Row(
            children: List.generate(3, (i) {
              List<String> titles = ['全部', '只看原创', '只看想法'];
              String title = titles[i];
              return Expanded(
                flex: 1,
                child: Container(
                  height: 36,
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: FlatButton(
                      child: Text(title),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        isExpanded == true ?
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
                if (isExpanded == true) {
                  expandAnim.forward();
                } else {
                  expandAnim.reverse();
                }
              });
            },
            child: Container(
              color: Color.fromARGB((50.0 * expandAnim.value).toInt(), 0, 0, 0),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}
