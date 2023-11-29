import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'favorite_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model.dart';

class DetailPage extends StatefulWidget {
  final Teams? teams;
  DetailPage({required this.teams});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Box<FavoriteModel> favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box<FavoriteModel>('favorit');
  }

  bool isFavorite(String idTeam) {
    return favoritesBox.containsKey(idTeam);
  }

  void toggleFavorite(BuildContext context) {
    final String idTeam = widget.teams?.idTeam ?? '';
    if (isFavorite(idTeam)) {
      favoritesBox.delete(idTeam);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed from favorites'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      favoritesBox.put(
        idTeam,
        FavoriteModel(idTeam: idTeam, isFavorite: true),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to favorites'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            '${widget.teams?.strTeam ?? 'Unknown'} ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => toggleFavorite(context),
            icon: Icon(
              isFavorite('${widget.teams?.idTeam}' ?? '')
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              color: isFavorite('${widget.teams?.idTeam}' ?? '')
                  ? Colors.yellow
                  : null,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '${widget.teams?.strKeywords ?? 'Unknown'} ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: Image.network(
                      '${widget.teams?.strTeamBadge}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Formed Year',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  '${widget.teams?.intFormedYear}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  '${widget.teams?.strDescriptionEN}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Social Media',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildIconButton(
                                    icon: Icon(CupertinoIcons.globe),
                                    onPressed: () {
                                      launcher('Website ${widget.teams?.strWebsite}');
                                    },
                                  ),
                                  _buildIconButton(
                                    icon: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/2048px-Instagram_logo_2022.svg.png'),
                                    onPressed: () {
                                      launcher('Instagram ${widget.teams?.strInstagram}');
                                    },
                                  ),
                                  _buildIconButton(
                                    icon: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png'),
                                    onPressed: () {
                                      launcher('Twitter ${widget.teams?.strTwitter}');
                                    },
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Stadium',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildStadiumInfo(
                        'Stadium Name:',
                        '${widget.teams?.strStadium ?? 'Unknown'}',
                      ),
                      _buildStadiumInfo(
                        'Stadium Capacity:',
                        '${widget.teams?.intStadiumCapacity ?? 'Unknown'}',
                      ),
                      _buildStadiumInfo(
                        'Stadium Location:',
                        '${widget.teams?.strStadiumLocation ?? 'Unknown'}',
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Stadium Description:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          '${widget.teams?.strStadiumDescription ?? 'No description available.'}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launcher(String url) async {
    final Uri _url = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    if (!await launchUrl(_url)) {
      throw Exception("Failed to launch URL: $_url");
    }
  }

  Widget _buildStadiumInfo(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(8),
          child: Text(
            content,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
  Widget _buildIconButton({required Widget icon, required VoidCallback onPressed}) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }

}
