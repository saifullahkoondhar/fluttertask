import 'package:flutter/material.dart';
import 'package:fluttertask/helpers/app_theme.dart';
import 'package:fluttertask/modules/home/screens/booking_drid.dart';
import 'package:fluttertask/modules/home/screens/navigation_bar.dart';
import 'package:fluttertask/modules/home/screens/services.dart';
import 'package:fluttertask/widgets/custom_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.homeBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.homeBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/loc_icon.png",
                    width: 25,
                    height: 25,
                    color: Colors.black54,
                  ),
                ),
                const Text(
                  "1 Burnel Wy., Slough SL1 1FQ",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  "assets/icons/bell_con.png",
                  width: 25,
                  height: 25,
                ),
                customSpace(size.width * 0.01, isHorizontalSpace: true),
                Image.asset(
                  "assets/icons/hamburg_icon.png",
                  width: 25,
                  height: 25,
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSpace(size.height * 0.01),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              customSpace(size.height * 0.01),
              Container(
                width: double.infinity,
                height: 172,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Looking for',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Specialist Health care',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Schedule an appointment',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'with our care taker',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/icons/doc_img.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              customSpace(size.height * 0.01),
              const Text(
                'Recent Bookings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: const BookingGrid(),
              ),
              customSpace(size.height * 0.01),
              const Text(
                'Past Bookings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: const BookingGrid(),
              ),
              customSpace(size.height * 0.01),
              const Text(
                'Services',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Services(),
              customSpace(size.height * 0.01),
              const Text(
                'Past Bookings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: const BookingGrid(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 40),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          elevation: 0,
          onPressed: () => debugPrint("Add Button pressed"),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
