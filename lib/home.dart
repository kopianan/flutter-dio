import 'package:flutter/material.dart';
import 'package:flutter_dio/api/api_repository.dart';

import 'api/models/post_model/post_model.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiRepository _apiRepository = ApiRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _apiRepository.getDataPostFromApi,
          builder:
              (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.waiting:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.active:
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Container(
                    child: Center(
                      child: Text("Something Wrong"),
                    ),
                  );
                } else {
                  return BuildList(
                    listData: snapshot.data,
                  );
                }
                break;
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class BuildList extends StatelessWidget {
  const BuildList({Key key, this.listData}) : super(key: key);

  final List<PostModel> listData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listData[index].title),
            subtitle: Text(listData[index].body),
          );
        },
      ),
    );
  }
}
