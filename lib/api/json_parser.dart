import 'dart:convert';
import 'package:airplane_type/model/bannerModel.dart';
import 'package:airplane_type/model/cat_list.dart';
import 'package:airplane_type/model/latest_video.dart';
import 'package:http/http.dart';
class JsonParser{
  static List<BannerModel> getBanner(Response response) {
    List<BannerModel> bannerModel=[];
    Map<String,dynamic> map=jsonDecode(response.body);
    List<dynamic> body=map["ALL_IN_ONE_VIDEO"];
    body.forEach((element) {
      Map item=element;
      String id = item['id'];
      String bannerName = item['banner_name'];
      String bannerImage = item['banner_image'];
      String bannerImageThumb = item['banner_image_thumb'];
      String bannerUrl = item['banner_url'];
      bannerModel.add(BannerModel(id, bannerName, bannerImage, bannerImageThumb, bannerUrl));
    });
      return bannerModel;
  }
  static List<CatList> getCatList(Response response){
    List<CatList> catList=[];
    Map<String,dynamic> map=jsonDecode(response.body);
    List<dynamic> body=map["ALL_IN_ONE_VIDEO"];
    body.forEach((element) {
      Map item=element;
      String cid=item['cid'];
      String categoryName=item['category_name'];
      String categoryImage=item['category_image'];
      String categoryImageThumb=item['category_image_thumb'];
      catList.add(CatList(cid, categoryName, categoryImage, categoryImageThumb));
    });
    return catList;
  }
  static List<LatestVideo> getLatestVideo(Response response){
    List<LatestVideo> latestVideo=[];
    Map<String,dynamic> map=jsonDecode(response.body);
    List<dynamic> body=map['ALL_IN_ONE_VIDEO'];
    body.forEach((element) {
      Map item=element;
      String id=item['id'];
      String catId=item['cat_id'];
      String videoType=item['video_type'];
      String videoTitle=item['video_title'];
      String videoUrl=item['video_url'];
      String videoId=item['video_id'];
      String videoThumbNailB=item['video_thumbnail_b'];
      String videoThumbNailS=item['video_thumbnail_s'];
      String videoDuration=item['video_duration'];
      String videoDescription=item['video_description'];
      String rateAvg=item['rate_avg'];
      String totalViewer=item['totel_viewer'];
      String cid=item['cid'];
      String categoryName=item['category_name'];
      String categoryImage=item['category_image'];
      String categoryImageThumb=item['category_image_thumb'];
      latestVideo.add(LatestVideo(id, catId, videoType, videoTitle, videoUrl,videoId, videoThumbNailB, videoThumbNailS, videoDuration, videoDescription, rateAvg, totalViewer, cid, categoryName, categoryImage, categoryImageThumb));
    });
    return latestVideo;
  }
}
