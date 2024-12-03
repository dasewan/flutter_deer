import 'package:flutter/material.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/base_dialog.dart';
import 'package:myapp9/widgets/load_image.dart';

/// design/7/index.html#artboard9
class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    Key? key,
    required this.onPressed,
    required this.list,
    required this.title,
    required this.indexed,
  }) : super(key: key);

  final Function(String, String) onPressed;
  final List<List> list;
  final String title;
  final int indexed;

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String _value = "1";
  String _text = "";
  // List<String> _list = widget.list;
  @override
  void initState() {
    _value = widget.list[0][1] as String;
    _text = widget.list[0][0] as String;
  }

  Widget _buildItem(int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Gaps.hGap16,
              Expanded(
                child: Text(
                  widget.list[index][0] as String,
                  style: _value == widget.list[index][1]
                      ? TextStyle(
                          fontSize: Dimens.font_sp14,
                          color: Theme.of(context).primaryColor,
                        )
                      : null,
                ),
              ),
              Visibility(visible: _value == widget.list[index][1], child: const LoadAssetImage('ic_check', width: 16.0, height: 16.0)),
              Gaps.hGap16,
            ],
          ),
        ),
        onTap: () {
          if (mounted) {
            setState(() {
              _value = widget.list[index][1] as String;
              _text = widget.list[index][0] as String;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: widget.title,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, mainAxisSize: MainAxisSize.min, children: List.generate(widget.list.length, (i) => _buildItem(i))),
      onPressed: () {
        NavigatorUtils.goBack(context);
        widget.onPressed(_value, _text);
      },
    );
  }
}
