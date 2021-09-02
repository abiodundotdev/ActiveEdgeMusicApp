class AlbumModel {
  String userName;
  String userId;
  AlbumModel({this.userName, this.userId});

  factory AlbumModel.fromJson(Map data) {
    return AlbumModel(
      userName: data['name'],
      userId: data['id'],
    );
  }
}
