import 'package:airplane_type/model/cat_list.dart';
import 'package:flutter/material.dart';
class CategoryPage extends StatefulWidget {
  final CatList catList;
  const CategoryPage({Key? key,required this.catList}) : super(key: key);
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.catList.categoryName}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.height,
            child: Card(
              elevation: 10,
                child: Image.network(widget.catList.categoryImage!,fit: BoxFit.cover,)
            ),
          )
        ],
      )
      ,
    );
  }
}
