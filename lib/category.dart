import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.title, this.isSelected = false})
      : super(key: key);
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (isSelected ? 3 : 2.5) / 1,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.orange.withOpacity(.7)
              : Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        child: Text(title,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade500,
                fontWeight: isSelected ? FontWeight.bold : null,
                fontSize: isSelected ? 18 : 16)),
      ),
    );
  }
}
