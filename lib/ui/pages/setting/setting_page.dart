import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 200.0,
        children: [
          InkWell(
            onTap: () {},
            child: const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.abc),
                  Text('Empresas'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Card(
              child: FaIcon(FontAwesomeIcons.house),
            ),
          ),
        ],
      ),
    );
  }
}
