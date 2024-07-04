import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownSearchWidget extends StatelessWidget {
  final String label;
  final List<String> items;
  final String selectedItem;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;

  const DropdownSearchWidget({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: selectedItem,
      validator: validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownSearch<String>(
                items: items,
                selectedItem: selectedItem,
                onChanged: (value) {
                  state.didChange(value);
                  onChanged(value);
                },
                dropdownButtonProps: const DropdownButtonProps(
                    icon: Icon(Icons.keyboard_arrow_down)),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: label,
                    border: const UnderlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                  showSearchBox: true,
                  isFilterOnline: true,
                  constraints: BoxConstraints(
                    maxHeight: 200,
                  ),
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  state.errorText ?? '',
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
