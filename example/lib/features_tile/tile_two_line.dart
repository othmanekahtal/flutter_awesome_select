import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import '../options.dart' as options;

class FeaturesTileTwoLine extends StatefulWidget {
  @override
  _FeaturesTileTwoLineState createState() => _FeaturesTileTwoLineState();
}

class _FeaturesTileTwoLineState extends State<FeaturesTileTwoLine> {

  String _day = 'fri';
  List<String> _month = ['apr'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        SmartSelect<String>.single(
          title: 'Days',
          value: _day,
          options: options.days,
          onChange: (state) => setState(() => _day = state.value),
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
        const Divider(indent: 20),
        SmartSelect<String>.multiple(
          title: 'Month',
          value: _month,
          options: options.months,
          onChange: (state) => setState(() => _month = state.value),
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}