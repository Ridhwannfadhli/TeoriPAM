import 'package:finalprojectmobile/convert.dart';
import 'package:finalprojectmobile/listFavorite.dart';

import 'package:finalprojectmobile/profil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list.dart';

class Homepgae extends StatefulWidget {
  const Homepgae({super.key});

  @override
  State<Homepgae> createState() => _HomepgaeState();
}

class _HomepgaeState extends State<Homepgae> {
  int _selectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "IndoFutbol League",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.greenAccent[700],
        automaticallyImplyLeading: false,

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TeamListPage();
                    }));
                  },
                  child: Container(
                    // color: Colors.white,
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/img/download.png',
                          width: 200,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Liga Indonesia",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CurrencyAndTimeConverterScreen();
                    }));
                  },
                  child: Container(
                    // color: Colors.white,
                    padding: EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.currency_exchange, // Ganti dengan ikon yang diinginkan
                          size: 100,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Converter",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
            ),
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
