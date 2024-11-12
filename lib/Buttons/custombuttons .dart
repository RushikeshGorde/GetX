import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;

  const CustomButtons({
    Key? key,
    required this.onSavePressed,
    required this.onCancelPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => {},
            onExit: (_) => {},
            child: InkWell(
              onTap: onCancelPressed,
              hoverColor: const Color.fromARGB(255, 34, 255, 0).withOpacity(0.4), // Hover effect color
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: const Text(
                  'Clear',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
           const SizedBox(width: 10),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => {},
            onExit: (_) => {},
            child: InkWell(
              onTap: onSavePressed,
              hoverColor: const Color.fromARGB(255, 62, 237, 27).withOpacity(0.4), // Hover effect color
              borderRadius: BorderRadius.circular(3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
         
         
        ],
      ),
    );
  }
}
