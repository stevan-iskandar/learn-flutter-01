import 'package:flutter/material.dart';
import '../../models/widgets/routes.dart';
import '../../models/widgets/sample.dart';
import 'sample_item_details_screen.dart';
import '../../widgets/now_ui/now_elevated_button.dart';
import '../../widgets/base_navbar.dart';

class SampleItemScreen extends StatelessWidget {
  const SampleItemScreen({
    Key? key,
    this.items = const [Sample(1), Sample(2), Sample(3)],
  }) : super(key: key);

  final List<Sample> items;

  static const Routes route = Routes(
    title: 'Sample',
    name: 'sample',
    url: '/sample',
  );

  @override
  Widget build(BuildContext context) {
    return BaseNavbar(
      title: route.title,
      name: route.name,
      body: ListView.builder(
        restorationId: 'sampleItemScreen',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.only(
              start: 8,
              top: 8,
              end: 8,
            ),
            child: NowElevatedButton(
              text: 'SampleItem ${item.id}',
              onPressed: () {
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsScreen.route.url,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
