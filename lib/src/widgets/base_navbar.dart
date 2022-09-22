import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_01/src/models/widgets/now_drawer_menus.dart';
import 'package:learn_flutter_01/src/screens/sample/sample_item_screen.dart';
import 'package:learn_flutter_01/src/screens/settings/settings_screen.dart';
import '../widgets/now_ui/navbar.dart';
import '../widgets/now_ui/now_drawer.dart';

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

  List<NowDrawerMenus> get menus => [
        const NowDrawerMenus(
          title: 'Home',
          name: 'home',
          url: '/home',
          icon: FontAwesomeIcons.house,
        ),
        NowDrawerMenus(
          title: SampleItemScreen.route.title,
          name: SampleItemScreen.route.name,
          url: SampleItemScreen.route.url,
          icon: FontAwesomeIcons.dharmachakra,
        ),
        const NowDrawerMenus(
          title: 'Articles',
          name: 'articles',
          url: '/articles',
          icon: FontAwesomeIcons.newspaper,
        ),
        const NowDrawerMenus(
          title: 'Profile',
          name: 'profile',
          url: '/profile',
          icon: FontAwesomeIcons.user,
        ),
        // const NowDrawerMenus(
        //   title: 'Account',
        //   name: 'account',
        //   url: '/account',
        //   icon: FontAwesomeIcons.fileInvoice,
        // ),
        NowDrawerMenus(
          title: SettingsScreen.route.title,
          name: SettingsScreen.route.name,
          url: SettingsScreen.route.url,
          icon: FontAwesomeIcons.gear,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(title: title),
      drawer: NowDrawer(
        menus: menus,
        currentPage: name,
      ),
      body: body,
    );
  }
}
