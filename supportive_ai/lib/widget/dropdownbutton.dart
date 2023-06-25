import 'package:flutter/material.dart';

class MyDropButton extends StatefulWidget {
  final String labelText;
  final selectedValue ;
  final IconData prefixIcon;
  final List<String> items;
  final void Function(String?)? onChanged;

  const MyDropButton({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.items,
    this.onChanged, required this.selectedValue,
  }) : super(key: key);

  @override
  State<MyDropButton> createState() => _MyDropButtonState();
}

class _MyDropButtonState extends State<MyDropButton> {
  String ?selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.prefixIcon),
      ),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      validator: (value) {
    if (value == null) {
      return 'This field is required';
    }
    return null;
  },
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
