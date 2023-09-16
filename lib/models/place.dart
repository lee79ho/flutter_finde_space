
class Place{

  final String name;
  final double latitude;
  final double longitude;
  final String placeId;
  final String photoURL;


  Place({required this.name, required this.placeId, required this.latitude, required this.longitude, required this.photoURL});

  factory Place.fromJson(Map<String, dynamic> json){
    final location = json["geometry"]["location"];

    return Place(
      placeId: json["place_id"],
      name: json["name"],
      latitude: location["lat"],
      longitude: location["lng"],
      photoURL: (json["photo"][0])["photo_reference"]

    );
  }


}