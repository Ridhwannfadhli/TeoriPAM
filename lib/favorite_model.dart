import 'package:hive/hive.dart';

part 'favorite_model.g.dart';
@HiveType(typeId:0)

class FavoriteModel extends HiveObject{
  @HiveField(0)
  late String idTeam;

  @HiveField(1)
  late bool isFavorite;



  FavoriteModel({
    required this.idTeam,
    required this.isFavorite,
});
}