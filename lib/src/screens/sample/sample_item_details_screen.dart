import 'package:flutter/material.dart';
import '../../models/widgets/routes.dart';
import '../../widgets/icon_button_to_settings.dart';

class SampleItemDetailsScreen extends StatelessWidget {
  const SampleItemDetailsScreen({Key? key}) : super(key: key);

  static const Routes route = Routes(
    title: 'Sample Details',
    name: 'sample.item',
    url: '/sample-item',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(route.title),
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
