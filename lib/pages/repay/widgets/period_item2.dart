import 'package:flutter/material.dart';

class PeriodItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final ValueChanged<bool> onSelect;

  const PeriodItem({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          color: isSelected ? Colors.blue[50] : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () => {onSelect(!isSelected)},
              child: Center(
                child: Text(index.toString()),
              ),
            ),
          ),
        ));
  }
}
