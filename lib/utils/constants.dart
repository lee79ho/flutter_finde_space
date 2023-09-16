

class Constants {



  static String TOOP_HEADLINES_URL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=8557ae786cf148b2ac4880a244d59e78";

  static String headlinesFor(String keyword){
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=8557ae786cf148b2ac4880a244d59e78";
    
  }

}
