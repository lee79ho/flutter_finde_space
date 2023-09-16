



class UrlHelper{


static String urlForPlaceKeywordAndLocation(String keyword, double latitude, double longitude, String USER_KEY)
{
  return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radious=1500&type=restaurant&keyword=$keyword&key=$USER_KEY";

}


}