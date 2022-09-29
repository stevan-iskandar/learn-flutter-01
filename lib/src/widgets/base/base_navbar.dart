import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/widgets/now_drawer_menu.dart';
import '../../screens/sample/sample_item_screen.dart';
import '../../screens/settings/settings_screen.dart';
import '../now_ui/now.dart';

class BaseNavbar extends StatelessWidget {
  const BaseNavbar({
    Key? key,
    required this.title,
    required this.name,
    required this.body,
  }) : super(key: key);

  final String title;
  final String name;
  final Widget body;

  List<NowDrawerMenu> get menus => [
        const NowDrawerMenu(
          title: 'Home',
          name: 'home',
          url: '/home',
          icon: FontAwesomeIcons.house,
        ),
        NowDrawerMenu(
          title: SampleItemScreen.route.title,
          name: SampleItemScreen.route.name,
          url: SampleItemScreen.route.url,
          icon: FontAwesomeIcons.dharmachakra,
        ),
        const NowDrawerMenu(
          title: 'Articles',
          name: 'articles',
          url: '/articles',
          icon: FontAwesomeIcons.newspaper,
        ),
        const NowDrawerMenu(
          title: 'Profile',
          name: 'profile',
          url: '/profile',
          icon: FontAwesomeIcons.user,
        ),
        // const NowDrawerMenu(
        //   title: 'Account',
        //   name: 'account',
        //   url: '/account',
        //   icon: FontAwesomeIcons.fileInvoice,
        // ),
        NowDrawerMenu(
          title: SettingsScreen.route.title,
          name: SettingsScreen.route.name,
          url: SettingsScreen.route.url,
          icon: FontAwesomeIcons.gear,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NowNavbar(title: title),
      drawer: NowDrawer(
        menus: menus,
        currentPage: name,
      ),
      body: body,
    );
  }
}
