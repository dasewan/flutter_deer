import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/widgets/my_app_bar.dart';


class RepayPage extends StatefulWidget {
  const RepayPage({Key? key, required this.borrowId}) : super(key: key);
  final String borrowId;

  @override
  _RepayPageState createState() => _RepayPageState();
}

class _RepayPageState extends State<RepayPage> {

  final List<bool> _selected = List.generate(10, (_) => false);

  @override
  void initState() {
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("Dependencies change");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'Repay',
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                // return Text("data");
                return PeriodItem(
                  index: index,
                  isSelected: _selected[index],
                  onSelect: (select) {
                    if (select) {
                      for (var i = 0; i <= index; i++) {
                        _selected[i] = true;
                      }
                    } else {
                      for (var i = index; i < _selected.length; i++) {
                        _selected[i] = false;
                      }
                    }
                    setState(() {});
                  },
                );
              }),
        ));
  }
}

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
    return Container(
      color: isSelected ? Colors.blue[50] : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () => {onSelect(!isSelected)},
          child: Center(child: Text(index.toString()),),
        ),
      ),
    );
  }
}
