import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildNavItem(
                selectIcon: 'assets/icon/home_on.png',
                unselectIcon: 'assets/icon/home_off.png',
                lebel: ' Home',
                index: 0),
            _buildNavItem(
                selectIcon: 'assets/icon/community_s.png',
                unselectIcon: 'assets/icon/community_off.png',
                lebel: 'Community',
                index: 1),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xB3F6F6F6),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  'assets/icon/add.png',
                  width: 26,
                  height: 26,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
            _buildNavItem(
                selectIcon: 'assets/icon/notification_s.png',
                unselectIcon: 'assets/icon/notification_off.png',
                lebel: 'Notification',
                index: 2),
            _buildNavItem(
                selectIcon: 'assets/icon/sms_s.png',
                unselectIcon: 'assets/icon/sms_un.png',
                lebel: 'Message',
                index: 3),
          ],
        ),
      ),


      body: Stack(
        children: [
           Center(child: Text('Selected Index: $_selectedIndex')),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(height: 1,color: Colors.grey.shade200,))
        ],
      ),
    );
  }

  Widget _buildNavItem(
      {required String? selectIcon,
      required String? unselectIcon,
      required String? lebel,
      required int? index}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index!),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _selectedIndex == index
                ? Image.asset(
                    selectIcon!,
                    width: 25,
                    height: 25,
                    color: Colors.black87,
                  )
                : Image.asset(
                    unselectIcon!,
                    width: 25,
                    height: 25,
                    color: Colors.black54,
                  ),
            Text(
              lebel!,
              style: TextStyle(
                fontSize: 12,
                  color:
                      _selectedIndex == index ? Colors.black87 : Colors.black54,
                  fontWeight: _selectedIndex == index
                      ? FontWeight.w600
                      : FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
