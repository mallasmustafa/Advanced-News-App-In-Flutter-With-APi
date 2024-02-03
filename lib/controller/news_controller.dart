import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:news_app2/Model/NewsModel.dart';
class NewsController extends GetxController{

  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews5 = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNews5 = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> businessNews5 = <NewsModel>[].obs;
  RxBool isTrandingNewsLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isTeslaNewsLoading = false.obs;
  RxBool isBusinessNewsLoading = false.obs;
  RxBool isSpeeking = false.obs;
  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() async{
    super.onInit();
    getTrandingNews();
    getNewsForYou();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }

  Future<void> getTrandingNews()async{
    isTrandingNewsLoading.value = true;
    try{
      var baseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=49d6a96cccc8433b9a2f7fb97f2f44c3";
      var response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for(var news in articles){
          trandingNewsList.add(NewsModel.fromJson(news));
        }
      }else {
        Get.snackbar("Error", "Something went wrong in tranding news");
      }
    }catch(e){
      print(e);
    }
    isTrandingNewsLoading.value = false;
  }
  Future<void> getNewsForYou()async{
    try{
      isNewsForYouLoading.value = true;
      var baseUrl = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=49d6a96cccc8433b9a2f7fb97f2f44c3";
      var response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for(var news in articles){
          newsForYouList.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYouList.sublist(0, 5).obs;
      }else{
        Get.snackbar("Error", "Something went wrong in News For you");
      }
    } catch (e){
      print(e);
    }
    isNewsForYouLoading.value = false;
  }
  Future<void> getAppleNews()async{
    isAppleNewsLoading.value = true;
    try{
      var baseUrl = "https://newsapi.org/v2/everything?q=apple&from=2024-01-30&to=2024-01-30&sortBy=popularity&apiKey=49d6a96cccc8433b9a2f7fb97f2f44c3";
      var response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for(var news in articles){
          appleNewsList.add(NewsModel.fromJson(news));
        }
        appleNews5.value = appleNewsList.sublist(0,5).obs;
      }else{
        Get.snackbar("Error", "Something went wrong in apple News");
      }
    }catch(e){
      print(e);
    }
    isAppleNewsLoading.value = false;
  }
  Future<void> getTeslaNews()async{
    try{
      isTeslaNewsLoading.value = true;
    var baseUrl = "https://newsapi.org/v2/everything?q=tesla&from=2024-01-03&sortBy=publishedAt&apiKey=49d6a96cccc8433b9a2f7fb97f2f44c3";
    var response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      var articles = body["articles"];
      for(var news in articles){
        teslaNewsList.add(NewsModel.fromJson(news));
      }
      teslaNews5.value = teslaNewsList.sublist(0,5).obs;
    }else{
      Get.snackbar("Error", "Something went wrong in tesla News For you");
    }
  } catch(e){
      print(e);
    }
    isTeslaNewsLoading.value = false;
  }
  Future<void> getBusinessNews()async{
    try{
      isBusinessNewsLoading.value=true;
    var baseUrl= "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=49d6a96cccc8433b9a2f7fb97f2f44c3";
    var response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      var articles = body["articles"];
      for(var news in articles){
        businessNewsList.add(NewsModel.fromJson(news));
      }
      businessNews5.value= businessNewsList.sublist(0,5).obs;
    }else{
      Get.snackbar("Error", "Something went wrong in business News For you");
    }
  } catch(e){
      print(e);
    }
    isBusinessNewsLoading.value=false;
  }
  Future<void> searchNews(String search)async{
    try{
      isNewsForYouLoading.value=true;
    var baseUrl= "https://newsapi.org/v2/everything?q=$search&apiKey=49d6a96cccc8433b9a2f7fb97f2f44c3";
    var response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      var body = jsonDecode(response.body);
      var articles = body["articles"];
      newsForYouList.clear();
      int i = 0;
      for(var news in articles){
        i++;
        newsForYouList.add(NewsModel.fromJson(news));
        if(i==20){
          break;
        }
      }
    }else{
      Get.snackbar("Error", "Something went wrong in Search field");
    }
  } catch(e){
      print(e);
    }
    isNewsForYouLoading.value=false;
  }
  Future<void> speak(String text)async{
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1);
    await flutterTts.awaitSpeakCompletion(true);
    isSpeeking.value=true;
    await flutterTts.speak(text);
    isSpeeking.value=false;
  }
  void stop() {
    if (isSpeeking.value) {
      flutterTts.stop();
      isSpeeking.value = false;
    }
  }
}