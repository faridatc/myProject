import 'package:airplane_type/api/web_service.dart';
import 'package:airplane_type/model/bannerModel.dart';
import 'package:airplane_type/model/cat_list.dart';
import 'package:airplane_type/model/latest_video.dart';
import 'package:flutter/material.dart';
import 'category_page.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Future<List<BannerModel>> bannerModel=WebService.getBanner();
  Future<List<CatList>> catList=WebService.getCatList();
  Future<List<LatestVideo>> latestVideo=WebService.getLatestVideo();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WebService.getBanner();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Type of Airplanes'),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
                FutureBuilder<List<BannerModel>>(
                  future: bannerModel,
                  builder: (context,snapshot){
                      if(snapshot.hasData){
                          return SizedBox(
                              height: 130,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context,index){
                                        return SizedBox(
                                            height: 130,
                                            width: MediaQuery.of(context).size.width,
                                            child: Card(
                                                child: Image.network(snapshot.data![index].bannerImage!,fit: BoxFit.cover,),
                                            ),
                                        );
                                  }),
                          );
                      }
                      else{
                        return const CircularProgressIndicator();
                      }
                  }
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('دسته بندی انواع هواپیماها',style: TextStyle(fontSize: 20,color: Colors.green,),),
                FutureBuilder<List<CatList>>(
                  future: catList,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return SizedBox(
                        height: 170,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryPage(catList: snapshot.data![index],)));
                              },
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: 200,
                                child: Card(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data![index].categoryName!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                      Image.network(snapshot.data![index].categoryImage!,fit: BoxFit.cover,)
                                    ],
                                  ),
                                )
                              ),
                            );
                          }
                        ),
                      );
                    }
                    else
                    {
                      return const CircularProgressIndicator();
                    }
                  }
                ),
               const SizedBox(
                height: 15,
              ),
               const Text('آخرین ویدیوها',style: TextStyle(fontSize: 20,color: Colors.green,),),
               FutureBuilder<List<LatestVideo>>(
                future: latestVideo,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 290,
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(snapshot.data![index].videoTitle!,style: const TextStyle(fontSize: 20,color: Colors.red),),
                                    Image.network(snapshot.data![index].videoThumbNailB!,width: 400,height: 250,)
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    );
                  }
                  else{
                    return const CircularProgressIndicator();
                  }
                }
              ),
          ]
          ),
        ),
      ),
    );
  }
}
