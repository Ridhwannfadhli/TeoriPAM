import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.greenAccent[700],
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1, // Adjust this to the number of elements you have
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 250,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/img/profile.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Muhammad Ridhwan Fadhli',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '124210075',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Jakarta, 2 Juli 2003',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Saran Mata Kuliah: Tugasnya sepertinya kurang banyak, jadi mungkin bisa ditambah lagi untuk tugasnya',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Kesan Mata Kuliah: Pemrograman mobile ini sangat menarik dan menyenangkan, apalagi jika diajar oleh pak Bagus ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 80), // Just for extra space at the bottom
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent[700],
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepgae()),
            );
          }
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Beranda',
              backgroundColor: Colors.greenAccent[700]),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'Favorite',
              backgroundColor: Colors.greenAccent[700]),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Profile',
              backgroundColor: Colors.greenAccent[700]),
        ],
      ),
    );

  }
}
