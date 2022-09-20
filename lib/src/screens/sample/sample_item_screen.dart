import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';
import '../../constants/routes.dart';
import '../../models/widgets/sample.dart';
import 'sample_item_details_screen.dart';
import '../../widgets/now_ui/navbar.dart';
import '../../widgets/now_ui/now_drawer.dart';
import '../../widgets/now_ui/now_elevated_button.dart';

class SampleItemScreen extends StatelessWidget {
  const SampleItemScreen({
    Key? key,
    this.items = const [Sample(1), Sample(2), Sample(3)],
  }) : super(key: key);

  static const String routeName = Routes.sample;

  final List<Sample> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: 'Sample'),
      drawer: const NowDrawer(currentPage: 'Components'),
      backgroundColor: NowUIColors.bgColorScreen,
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
            child: NowElevatedButton(
              text: 'SampleItem ${item.id}',
              onPressed: () {
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsScreen.routeName,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
