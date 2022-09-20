import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import '../../widgets/icon_button_to_settings.dart';

class SampleItemDetailsScreen extends StatelessWidget {
  const SampleItemDetailsScreen({Key? key}) : super(key: key);

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
