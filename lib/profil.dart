import 'package:finalprojectmobile/listFavorite.dart';
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
  int _selectedIndex = 2;
  late SharedPreferences logindata;
  late String username;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  // Future<void> _logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('username');
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginPage()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.greenAccent[700],
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (){
              logindata.setBool('login', true);
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => LoginPage()));
            }
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
                  Container(
                    height: 250,
                    width: 325,
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
                  ),
              ListTile(
                title: Text(
                  'Saran : Tugasnya sepertinya kurang banyak, jadi mungkin bisa ditambah lagi untuk tugasnya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Kesan : Pemrograman mobile ini sangat menarik dan menyenangkan, apalagi jika diajar oleh pak Bagus ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
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
              MaterialPageRoute(builder: (context) => FavoriteListPage()),
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
