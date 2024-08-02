import 'package:flutter/material.dart';

class BookingGrid extends StatelessWidget {
  const BookingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookings.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return BookingCard(
          image: bookings[index]['image']!,
          name: bookings[index]['name']!,
          specialty: bookings[index]['specialty']!,
          date: bookings[index]['date']!,
          status: bookings[index]['status']!,
        );
      },
      padding: const EdgeInsets.all(10),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;
  final String date;
  final String status;

  const BookingCard({
    super.key,
    required this.image,
    required this.name,
    required this.specialty,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(image,
                    width: 70, height: 120, fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  specialty,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 90,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Press Me',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> bookings = [
  {
    'image': 'assets/icons/ellis.png',
    'name': 'Doc David Jorn',
    'specialty': 'Pediatrics',
    'date': '04 May 2024',
    'status': 'Booked',
  },
  {
    'image': 'assets/icons/ellis.png',
    'name': 'Doc Ammera',
    'specialty': 'Pediatrics',
    'date': '04 May 2024',
    'status': 'Booked',
  },
  {
    'image': 'assets/icons/ellis.png',
    'name': 'Doc Ammera',
    'specialty': 'Pediatrics',
    'date': '04 May 2024',
    'status': 'Booked',
  },
  {
    'image': 'assets/icons/ellis.png',
    'name': 'Doc Ammera',
    'specialty': 'Pediatrics',
    'date': '04 May 2024',
    'status': 'Booked',
  },
  {
    'image': 'assets/icons/ellis.png',
    'name': 'Doc Ammera',
    'specialty': 'Pediatrics',
    'date': '04 May 2024',
    'status': 'Booked',
  },
];
