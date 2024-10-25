import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas2/pages/category_pages.dart';
import 'package:tugas2/pages/home_pages.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  final List<Widget> _children = const [HomePages(), CategoryPages()];
  int currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
      ? CalendarAppBar(
        accent: Colors.grey,
        backButton: false,
        locale: 'id',
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      )
      : PreferredSize(
        child: Container(
          child: Padding(
          padding: 
            const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
          child: Text('Categories', style: GoogleFonts.montserrat(fontSize: 20),),
        )), 
        preferredSize: Size.fromHeight(100)),
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.grey,
          child: Icon(Icons.add),
        ),
      ),
      body: _children[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onTapped(0);
              },
              icon: Icon(Icons.home),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                onTapped(1);
              },
              icon: Icon(Icons.list),
            )
          ],
        ),
      ),
    );
  }
}
