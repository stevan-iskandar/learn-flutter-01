import 'package:app_01/src/constants/routes.dart';
import 'package:app_01/src/ui/widgets/icon_button_to_settings.dart';
import 'package:flutter/material.dart';

class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({Key? key}) : super(key: key);

  static const String routeName = Routes.sampleItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        actions: const [
          IconButtonToSettings(),
        ],
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
