import 'package:flutter/material.dart';
import 'package:zhihu/page/main_page/main_page_focus_view.dart';
import 'package:zhihu/page/main_page/main_page_hot.dart';
import 'package:zhihu/page/main_page/main_page_recommand_view.dart';
import 'package:zhihu/viewmodel/main_page_view_model.dart';

class MainPage extends StatefulWidget {
  static String rName = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController controller;

  MainPageViewModel viewModel;

  @override
  void initState() {
    controller = TabController(
      length: 3,
      vsync: this,
    );
    viewModel = MainPageViewModel(
      refresh: () {
        setState(() {});
      },
      isExpanded: false,
      expandAnim: AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: this,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
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
              tabs: _tabList(),
              controller: controller,
              labelColor: Colors.black,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    children: <Widget>[
                      MainPageFocusView(),
                      MainPageRecmndView(),
                      MainPageHot(),
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
            child: Center(
              child: Image.asset(
                'assets/images/main_live.png',
                width: 20,
                height: 20,
              ),
            ),
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
            child: Center(
              child: Image.asset(
                'assets/images/main_history.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandView() {
    return Column(
      children: <Widget>[
        Container(
          height: 64.0 * viewModel.expandAnim.value,
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
        viewModel.isExpanded == true
            ? Expanded(
                child: GestureDetector(
                  onTap: viewModel.onFocusClicked,
                  child: Container(
                    color: Color.fromARGB((50.0 * viewModel.expandAnim.value).toInt(), 0, 0, 0),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  List<Tab> _tabList() {
    return [
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
                  onTap: viewModel.onFocusClicked,
                  child: viewModel.isExpanded == true ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
      Tab(text: '推荐'),
      Tab(text: '热榜'),
    ];
  }
}
