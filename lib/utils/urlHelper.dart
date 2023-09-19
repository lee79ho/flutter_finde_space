



class UrlHelper{

  static String urlForReferenceImage(String photoReferenceId){
     return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$phtoReferenceId&key=$USER_KEY";

  }


static String urlForPlaceKeywordAndLocation(String keyword, double latitude, double longitude, String USER_KEY)
{
  return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radious=1500&type=restaurant&keyword=$keyword&key=$USER_KEY";

}


}