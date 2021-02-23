import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learflutter/components/atoms/icon_button_normal.dart';
import 'package:learflutter/components/atoms/primary_button.dart';
import 'package:learflutter/components/molecules/default_alert_dialog.dart';
import 'package:learflutter/constant/color_pallete.dart';
import 'package:learflutter/ui/view/pages/favorite/favoritepage.dart';
import 'package:learflutter/ui/view/pages/home/homepage.dart';
import 'package:learflutter/ui/view/pages/profile/profilepage.dart';
import 'package:learflutter/ui/view/pages/statistics/statisticspage.dart';
import 'package:learflutter/ui/viewmodels/auth_viewmodel.dart';
import 'package:learflutter/ui/viewmodels/main_viewmodel.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final int initialPage;

  const Home({Key key, this.initialPage}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _currentTabIndex = 0;
  Map<String, IconData> _navItemMap = {
    'Home': Icons.home_outlined,
    'Favorite': Icons.favorite_outline,
    'Chart': Icons.bar_chart_outlined,
    'Profile': Icons.person_outline,
  };
  List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
    StatisticPage(),
    ProfilePage()
  ];
  List<BottomNavigationBarItem> _navItems = [];
  TabController _pageController;
  @override
  void initState() {
    var initialPage = 0;
    if (widget.initialPage != null && widget.initialPage <= _pages.length) {
      initialPage = widget.initialPage;
      _currentTabIndex=initialPage;
    }
    _pageController = TabController(
      vsync: this,
      length: _pages.length,
      initialIndex: initialPage,
    );

    _navItemMap.forEach((String key, IconData value) {
      _navItems.add(
        BottomNavigationBarItem(icon: Icon(value), label: key),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Flutter"),
        centerTitle: true,
        actions: [
          IconButtonNormal(
            icon: Icon(
              Icons.refresh,
              color: ColorPallete.backgroundLight,
            ),
            onPressed: () async {
              switch (_currentTabIndex) {
                case 0:
                  Provider.of<MainViewmodel>(context,listen: false).loadVideos();
                  break;
                case 1:
                  Provider.of<MainViewmodel>(context,listen: false).loadFavorite();
                  break;
                case 2:
                  Provider.of<MainViewmodel>(context,listen: false).loadCharts();
                  break;
                case 3:
                  Provider.of<AuthViewmodel>(context,listen: false).loadProfile();
                  break;
              }
            },
          ),
          IconButtonNormal(
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: ColorPallete.backgroundLight,
            ),
            onPressed: () async {
              bool isExit = await showDialog(
                context: context,
                builder: (context) => DefaultAlertDialog(
                  message: "are you sure to exit this app?",
                  title: "Warning",
                  actions: [
                    PrimaryButton(
                      icon: Icon(Icons.cancel_outlined),
                      text: "No",
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    PrimaryButton(
                      text: "Yes",
                      onPressed: () => Navigator.of(context).pop(true),
                    )
                  ],
                ),
              );
              if (isExit ?? false) {
                SystemNavigator.pop();
              }
            },
          ),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        items: _navItems,
        selectedItemColor: ColorPallete.primary,
        
        unselectedItemColor: ColorPallete.backgroundDark,
        onTap: (value) {
          setState(() {
            if (value < _pages.length) {
              _currentTabIndex = value;
              _pageController.animateTo(value);
            }
          });
        },
        currentIndex: _currentTabIndex,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
