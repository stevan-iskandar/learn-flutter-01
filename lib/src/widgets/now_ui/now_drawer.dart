import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/now_ui_colors.dart';
import '../../models/widgets/now_drawer_menus.dart';
import 'now_drawer_tile.dart';

class NowDrawer extends StatelessWidget {
  const NowDrawer({
    Key? key,
    this.currentPage,
  }) : super(key: key);

  final String? currentPage;

  final List<NowDrawerMenus> menus = const [
    NowDrawerMenus(
      title: 'Home',
      url: '/home',
      icon: FontAwesomeIcons.house,
    ),
    NowDrawerMenus(
      title: 'Components',
      url: '/components',
      icon: FontAwesomeIcons.dharmachakra,
    ),
    NowDrawerMenus(
      title: 'Articles',
      url: '/articles',
      icon: FontAwesomeIcons.newspaper,
    ),
    NowDrawerMenus(
      title: 'Profile',
      url: '/profile',
      icon: FontAwesomeIcons.user,
    ),
    NowDrawerMenus(
      title: 'Account',
      url: '/account',
      icon: FontAwesomeIcons.fileInvoice,
    ),
    NowDrawerMenus(
      title: 'Settings',
      url: '/settings',
      icon: FontAwesomeIcons.gear,
    ),
  ];

  _launchURL() async {
    Uri url = Uri(
      scheme: 'https',
      host: 'creative-tim.com',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: NowUIColors.primary,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.85,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/now_logo.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: NowUIColors.white.withOpacity(0.82),
                            size: 24.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                padding: const EdgeInsets.only(top: 36, left: 8, right: 16),
                children: menus
                    .map(
                      (menu) => NowDrawerTile(
                        title: menu.title,
                        isSelected: currentPage == menu.title,
                        icon: menu.icon,
                        onTap: () {
                          if (currentPage != menu.title) {
                            Navigator.pushReplacementNamed(context, menu.url);
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      height: 4,
                      thickness: 0,
                      color: NowUIColors.white.withOpacity(0.8),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 16,
                        bottom: 8,
                      ),
                      child: Text(
                        'DOCUMENTATION',
                        style: TextStyle(
                          color: NowUIColors.white.withOpacity(0.8),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    NowDrawerTile(
                      icon: FontAwesomeIcons.satellite,
                      onTap: _launchURL,
                      title: 'Getting Started',
                      isSelected: currentPage == 'Getting started',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
