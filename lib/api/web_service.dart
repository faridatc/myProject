import 'package:airplane_type/model/bannerModel.dart';
import 'package:http/http.dart' as http;
import '../model/cat_list.dart';
import '../model/latest_video.dart';
import 'json_parser.dart';
class WebService{
  static Future<List<BannerModel>> getBanner() async {
    List<BannerModel> bannersList = [];
    String url = 'http://mobilemasters.ir/apps/airplane/api.php?home_banner';
    var address = Uri.parse(url);
    await http.get(address);
    http.Response response = await http.get(address);
    if (response.statusCode == 200) {
      bannersList = JsonParser.getBanner(response);
    }
    return bannersList;
  }
  static Future<List<CatList>> getCatList() async{
    List<CatList> catList=[];
    String url='http://mobilemasters.ir/apps/airplane/api.php?cat_list';
    var address=Uri.parse(url);
    await http.get(address);
    http.Response response=await http.get(address);
    if(response.statusCode==200)
      {
        catList=JsonParser.getCatList(response);
      }
    return catList;
  }
  static Future<List<LatestVideo>> getLatestVideo() async{
    List<LatestVideo> latestVideo=[];
    String url='http://mobilemasters.ir/apps/airplane/api.php?latest_video';
    var address=Uri.parse(url);
    await http.get(address);
    http.Response response=await http.get(address);
    if(response.statusCode==200){
      latestVideo=JsonParser.getLatestVideo(response);
    }
    return latestVideo;
  }
}
