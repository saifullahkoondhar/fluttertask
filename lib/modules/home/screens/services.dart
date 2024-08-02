import 'package:flutter/material.dart';
import 'package:fluttertask/modules/home/screens/service_card.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        children: [
          ServiceCard(
            icon: Icons.person,
            label: 'Nurses',
            color: Colors.blue,
          ),
          ServiceCard(
            icon: Icons.favorite,
            label: 'ICU',
            color: Colors.red,
          ),
          ServiceCard(
            icon: Icons.local_hospital,
            label: 'Long term care',
            color: Colors.yellow,
          ),
          ServiceCard(
            icon: Icons.people,
            label: 'Social care',
            color: Colors.pink,
          ),
          ServiceCard(
            icon: Icons.home,
            label: 'Hospice',
            color: Colors.green,
          ),
          ServiceCard(
            icon: Icons.monitor_heart,
            label: 'Telemetry',
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
