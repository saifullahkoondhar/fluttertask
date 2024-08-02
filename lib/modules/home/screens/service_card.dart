import 'package:flutter/material.dart';
import 'package:fluttertask/widgets/custom_space.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  ServiceCard({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color.withOpacity(0.3),
      child: InkWell(
        onTap: () {
          // Handle on tap
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: color),
              customSpace(10),
              Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
