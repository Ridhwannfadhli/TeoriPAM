import 'package:finalprojectmobile/list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'base_network.dart';
import 'favorite_model.dart';
import 'model.dart';

class FavoriteListPage extends StatefulWidget {
  @override
  _FavoriteListPageState createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  late Box<FavoriteModel> favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box<FavoriteModel>('favorit');
    print(favoritesBox.values);
    fetchData();// Print all values in the favorites box
  }

  final ApiSource ApiTeam = ApiSource();
  late List<Teams> teams;

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
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text('Favorite Teams'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TeamListPage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: favoritesBox.listenable(),
        builder: (context, box, _) {
          final List<FavoriteModel> favoriteTeams = box.values.toList();
          if (favoriteTeams.isEmpty) {
            return Center(
              child: Text('No favorite teams yet.'),
            );
          }
          return ListView.builder(
            itemCount: favoriteTeams.length,
            itemBuilder: (context, index) {
              FavoriteModel favorite = favoriteTeams[index];
              Teams foundTeam = teams.firstWhere(
                    (team) => team.idTeam == '${favorite.idTeam}',
              );
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                      '${foundTeam.strTeamBadge}',
                      height: 60,
                      width: 50,
                      fit: BoxFit.fill,
                  ),
                  title: Text('${foundTeam.strTeam}'),
                  // You can add more details or customize the ListTile as needed
                ),
              );
            },
          );
        },
      ),
    );
  }
}
