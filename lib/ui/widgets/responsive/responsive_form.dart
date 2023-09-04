import 'package:alex_astudillo/ui/utils/responsive/responsive_screen.dart';
import 'package:alex_astudillo/ui/utils/responsive/responsive_screen_settings.dart';
import 'package:flutter/material.dart';

class ResponsiveForm extends StatelessWidget {
  const ResponsiveForm({super.key, required this.formFields});

  final List<Widget> formFields;

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenSettings settings = ResponsiveScreen().settings;
    return LayoutBuilder(
      builder: (context, constraints) {
        final List<_FormRow> rows = [];
        List<Widget> widgets = [];
        final int fieldsPerRow;
        if (constraints.maxWidth >= settings.desktopChangePoint) {
          fieldsPerRow = 3;
        } else if (constraints.maxWidth >= settings.tabletChangePoint) {
          fieldsPerRow = 2;
        } else {
          fieldsPerRow = 1;
        }
        for (final Widget widget in formFields) {
          widgets.add(widget);
          if (widgets.length == fieldsPerRow) {
            rows.add(_FormRow(children: widgets));
            widgets = [];
          }
        }
        if (widgets.isNotEmpty) {
          widgets.add(const SizedBox());
          rows.add(_FormRow(children: widgets));
        }
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1500.0),
            child: Column(
              children: rows,
            ),
          ),
        );
      },
    );
  }
}

class _FormRow extends StatelessWidget {
  const _FormRow({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];
    for (int i = 0; i < children.length; i++) {
      widgets.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 16.0, left: 8.0),
            child: children[i],
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    );
  }
}
