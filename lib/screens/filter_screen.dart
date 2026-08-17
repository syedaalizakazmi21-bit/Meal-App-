import 'package:flutter/material.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.appliedFilters});

  final Map<Filters, bool> appliedFilters;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.appliedFilters[Filters.glutenFree]!;
    _lactoseFree = widget.appliedFilters[Filters.lactoseFree]!;
    _vegetarian = widget.appliedFilters[Filters.vegetarian]!;
    _vegan = widget.appliedFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          Navigator.of(context).pop<Map<Filters, bool>>({
            Filters.glutenFree: _glutenFree,
            Filters.lactoseFree: _lactoseFree,
            Filters.vegetarian: _vegetarian,
            Filters.vegan: _vegan,
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // ...Filters.values.map(
            //   (filter) => SwitchListTile(
            //     title: Text(filter.name.titleCase),
            //     subtitle: Text("Only included ${filter.name.titleCase} meals"),
            //     value: _selectedFilters[filter] ?? false,
            //     onChanged: (switchValue) {
            //       setState(() {
            //         _selectedFilters[filter] = switchValue;
            //       });
            //     },
            //   ),
            // ),
            SwitchListTile(
              title: Text("Gluten-Free"),
              subtitle: Text("Only included Gluten-Free meals"),
              value: _glutenFree,
              onChanged: (switchValue) {
                setState(() {
                  _glutenFree = switchValue;
                });
              },
            ),
            SwitchListTile(
              title: Text("Lactose-Free"),
              subtitle: Text("Only included Lactose-Free meals"),
              value: _lactoseFree,
              onChanged: (switchValue) {
                setState(() {
                  _lactoseFree = switchValue;
                });
              },
            ),
            SwitchListTile(
              title: Text("Vegetarian"),
              subtitle: Text("Only included Vegetarian meals"),
              value: _vegetarian,
              onChanged: (switchValue) {
                setState(() {
                  _vegetarian = switchValue;
                });
              },
            ),
            SwitchListTile(
              title: Text("Vegan"),
              subtitle: Text("Only included Vegan meals"),
              value: _vegan,
              onChanged: (switchValue) {
                setState(() {
                  _vegan = switchValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
