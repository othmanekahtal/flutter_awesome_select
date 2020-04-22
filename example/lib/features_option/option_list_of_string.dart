import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class FeaturesOptionListOfString extends StatefulWidget {
  @override
  _FeaturesOptionListOfStringState createState() => _FeaturesOptionListOfStringState();
}

class _FeaturesOptionListOfStringState extends State<FeaturesOptionListOfString> {

  List<int> _categories = [];

  int _sort = 3;

  List<String> _categoriesOption = [
    'Electronics', 'Accessories', 'Smartwatch',
    'Smartphone', 'Audio & Video', 'Scientific'
  ];

  List<String> _sortOption = [
    'Popular', 'Most Reviews', 'Newest',
    'Low Price', 'High Price',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        Card(
          elevation: 3,
          margin: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SmartSelect<int>.multiple(
                  title: 'Categories',
                  value: _categories,
                  options: S2Option.listFrom<int, String>(
                    source: _categoriesOption,
                    value: (index, item) => index,
                    title: (index, item) => item,
                  ),
                  choiceType: S2ChoiceType.switches,
                  modalType: S2ModalType.popupDialog,
                  modalHeader: false,
                  onChange: (state) => setState(() => _categories = state.value),
                  tileBuilder: (context, state) {
                    return S2Tile.fromState(
                      state,
                      trailing: const Icon(Icons.arrow_drop_down),
                      isTwoLine: true,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
                child: VerticalDivider(),
              ),
              Expanded(
                child: SmartSelect<int>.single(
                  title: 'Sort By',
                  value: _sort,
                  options: S2Option.listFrom<int, String>(
                    source: _sortOption,
                    value: (index, item) => index,
                    title: (index, item) => item,
                  ),
                  modalType: S2ModalType.popupDialog,
                  modalHeader: false,
                  onChange: (state) => setState(() => _sort = state.value),
                  tileBuilder: (context, state) {
                    return S2Tile.fromState(
                      state,
                      trailing: const Icon(Icons.arrow_drop_down),
                      isTwoLine: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}