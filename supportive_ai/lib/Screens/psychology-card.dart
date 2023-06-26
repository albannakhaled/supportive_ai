import 'package:flutter/material.dart';

class PsychologyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: const Color.fromARGB(255, 208, 208, 208),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Psychology',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Psychology is the scientific study of the mind and behavior.',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Key Topics:',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '- Cognitive Psychology\n'
                '- Developmental Psychology\n'
                '- Social Psychology\n'
                '- Clinical Psychology',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
