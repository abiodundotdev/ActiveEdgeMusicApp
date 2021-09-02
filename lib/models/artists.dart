class ArtistModel {
  String userName;
  String userId;
  ArtistModel({this.userName, this.userId});

  factory ArtistModel.fromJson(Map data) {
    return ArtistModel(
      userName: data['name'],
      userId: data['id'],
    );
  }
}
