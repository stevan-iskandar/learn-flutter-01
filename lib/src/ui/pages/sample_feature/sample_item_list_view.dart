import 'package:app_01/src/constants/routes.dart';
import 'package:app_01/src/ui/pages/sample_feature/sample_item.dart';
import 'package:app_01/src/ui/pages/sample_feature/sample_item_details_view.dart';
import 'package:app_01/src/ui/widgets/icon_button_to_settings.dart';
import 'package:flutter/material.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const String routeName = Routes.sample;

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: const [
          IconButtonToSettings(),
        ],
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            title: Text('SampleItem ${item.id}'),
            leading: const CircleAvatar(
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            },
          );
        },
      ),
    );
  }
}
