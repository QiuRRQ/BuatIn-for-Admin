import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:admin/Models/theme/Theme.dart' as a ;
import 'package:admin/Models/theme/response.dart';
import 'package:admin/widgets/Widget_Templates/ThemeListTile.dart';
import 'package:admin/widgets/dependency_injector.dart';

enum MovieLoadMoreStatus { LOADING, STABLE }

class ThemeTile extends StatefulWidget {
  final Response resp;
  final String search;

  ThemeTile({Key key, this.resp, this.search}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ThemeTileState();
}

class ThemeTileState extends State<ThemeTile> {
  MovieLoadMoreStatus loadMoreStatus = MovieLoadMoreStatus.STABLE;
  final ScrollController scrollController = new ScrollController();
  List<a.Theme> listthemes = List();
  int currentPageNumber;
  CancelableOperation themeOperation;


  @override
  void initState() {
    listthemes = widget.resp.themes.cast<a.Theme>();
    print("list theme:${listthemes.length}");
    print("data : ${listthemes[0].name}");
    currentPageNumber = widget.resp.info.page;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    if (themeOperation != null) themeOperation.cancel();
    super.dispose();
  }

  bool onNotification(ScrollNotification notification) {
    print("in notif");
    if (notification is ScrollUpdateNotification) {
      print("in notif 2");
      if (scrollController.position.maxScrollExtent > scrollController.offset &&
          scrollController.position.maxScrollExtent - scrollController.offset <=
              50) {
        if (loadMoreStatus != null &&
            loadMoreStatus == MovieLoadMoreStatus.STABLE) {
          loadMoreStatus = MovieLoadMoreStatus.LOADING;
          themeOperation = CancelableOperation.fromFuture(Injector.internal()
              .themeRepository.fetchMovies(currentPageNumber + 1, widget.search).then((themesObject) {
            currentPageNumber = themesObject.info.page;
            loadMoreStatus = MovieLoadMoreStatus.STABLE;
            setState(() => listthemes.addAll(themesObject.themes.cast<a.Theme>()));
          }));
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onNotification,
      child: new ListView.builder(
        padding: EdgeInsets.only(
          top: 5.0,
        ),
        controller: scrollController,
        itemCount: listthemes.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
         return ThemesListTile(tema: listthemes[index]);
        },
      ), // GridView.builder
    ); // NotificationListener
  }
}