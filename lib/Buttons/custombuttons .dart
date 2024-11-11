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
    return Wrap(
      spacing: 16.0,
      runSpacing: 16.0,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: onSavePressed,
          // icon: const Icon(Icons.save, color: Colors.white,),
          label: const Text(
            'Save',
            style: TextStyle(fontSize: 16,color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFA0C8EB), 
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 12.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
          ),
        ),
        ElevatedButton.icon(
          onPressed: onCancelPressed,
          icon: const Icon(Icons.cancel,color: Colors.white,),
          label: const Text(
            'Cancel',
            style: TextStyle(fontSize: 16,color: Colors.white),
            
            
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 216, 32, 32),  // #a0c8eb color for Cancel button
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 12.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
          ),
        ),
      ],
    );
  }
}
