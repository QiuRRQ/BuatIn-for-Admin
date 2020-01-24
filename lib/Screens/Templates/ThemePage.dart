import 'package:flutter/material.dart';
import 'package:admin/Models/theme/response.dart';
import 'package:admin/Repository/ThemeProdRepository.dart';
import 'package:admin/widgets/Widget_Templates/ThemeTile.dart';

class ThemePage extends StatelessWidget {

  final String search;

  ThemePage(this.search);
  //int page = 1;
  ThemeProdRepository themeProdRepository = new ThemeProdRepository();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Templates"),
      ),
      body: new FutureBuilder<Response>(
          future: themeProdRepository.fetchMovies(1, search),
          builder: (context, snapshots) {
            if (snapshots.hasError)
              return Text("Error Occurred");
            switch (snapshots.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return ThemeTile(resp: snapshots.data,search: search);
              default:
            }
          }),
    );
  }
}