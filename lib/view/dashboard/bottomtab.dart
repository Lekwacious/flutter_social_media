
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/app_colors.dart';
import 'home.dart';
import '../notification/notification.dart';
import '../profile/profile.dart';


class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var token = LocalStorage.getToken();

    return CupertinoTabScaffold(
      backgroundColor: Colors.white,
      tabBar: CupertinoTabBar(
        onTap: (int index) {
          HapticFeedback.selectionClick();
          setState(() => tabIndex = index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svgs/home.svg",
              height: 25,
              color: tabIndex == 0
                  ? appPrimaryTwoColor
                  : appInactiveColor,
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
              size: 25,
              color: tabIndex == 1
                  ? appPrimaryTwoColor
                  : appInactiveColor,
            ),
            label: "Notification"
          ),

          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svgs/person.svg",
                height: 25,
                color: tabIndex == 2
                    ? appPrimaryTwoColor
                    : appInactiveColor,
              ),
              label: "Profile"
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return  CupertinoPageScaffold(
                  child: HomeScreen()
              );
            });

          case 1:
            return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                      child: Notiication()
                  );
                }
            );



          case 2:
            return CupertinoTabView(
                builder: (context) {
                  return  CupertinoPageScaffold(

                    child: Profile(),
                  );
                }
            );
          default:
            return CupertinoTabView(
                builder: (context) {
                  return  CupertinoPageScaffold(
                    child: HomeScreen(),
                  );
                }
            );
        }
      },
    );
  }
}
