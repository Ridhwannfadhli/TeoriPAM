
import 'package:finalprojectmobile/detailpage.dart';
import 'package:finalprojectmobile/homepage.dart';
import 'package:finalprojectmobile/listFavorite.dart';
import 'package:finalprojectmobile/profil.dart';
import 'package:flutter/material.dart';
import 'base_network.dart';
import 'model.dart';


class TeamListPage extends StatefulWidget {
  @override
  _TeamListPageState createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {
  int _currentIndex = 0;


  final ApiSource ApiTeam = ApiSource();
  late List<Teams> teams;

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the method to fetch data when the page is initialized
  }

  Future<void> fetchData() async {
    try {
      final data = await ApiTeam.getTeams();
      final modelTeams = ModelTeams.fromJson(data); // Assuming you have a TeamModel model class

      setState(() {
        teams = modelTeams.teams ?? [];
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error, show a message to the user, or retry the request
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[500],
      appBar: AppBar(
        title: Text('LIGA INDONESIA'),
        backgroundColor: Colors.greenAccent[700],
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: teams != null
          ? Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Set the number of columns in the grid
            crossAxisSpacing: 8.0, // Set the spacing between columns
            mainAxisSpacing: 8.0, // Set the spacing between rows
          ),
          itemCount: teams.length,
          itemBuilder: (context, index) {
            final team = teams[index];
            return Card(

              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(teams: team)));
                },
                child: Column(
                  children: [
                    Expanded(
                      child: team.strTeamBadge != null
                          ? Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Image.network(
                          team.strTeamBadge!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Icon(Icons.sports_soccer),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        team.strTeam ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent[700],
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FavoriteListPage()),
            );
          }if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }  else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Beranda',
              backgroundColor: Colors.greenAccent[700]
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'Favorite',
              backgroundColor: Colors.greenAccent[700]
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Profile',
              backgroundColor: Colors.greenAccent[700]
          ),
        ],
      ),
    );
  }
}