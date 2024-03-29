import 'package:art_guide_flutter/bloc/attractions_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:provider/provider.dart';

import './wiki_list_builder.dart';
import '../components/app_bar.dart';
import '../components/bottom_nav_bar.dart';
import '../ui/colors.dart';


class WikiListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AttractionListBloc>(
      builder: (_) => AttractionListBloc(),
      child: WikiListScreen(),
    );
  }
}


class WikiListScreen extends StatefulWidget {
  const WikiListScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WikiListScreenSate();
  }
}

class WikiListScreenSate extends State<WikiListScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.colorGreenStatus,
    ));

    AttractionListBloc listBloc = Provider.of<AttractionListBloc>(context);

    BottomNavBar bottomNavBar = BottomNavBar();

    return NotificationListener<ScrollNotification>(
      onNotification: (notificaton) =>
          bottomNavBar.navBarState.handleScrollNotification(notificaton),
      child: Scaffold(
        body: new CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            title: MyAppBar(),
            backgroundColor: Colors.transparent,
            floating: true,
          ),
          SliverGroupBuilder(
              decoration: ShapeDecoration(
                image: DecorationImage(
                    image: AssetImage('images/main_map_graphic.png'),
                    fit: BoxFit.fill),
                shape: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.none,
                  width: 1,
                ),
              ),
              child: SliverList(
                  delegate: SliverChildListDelegate(
                      WikiListBuilder.buildWikiCard(
                          listBloc.attractions, context))))
        ]),
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }
}

/////////////////////////////////////////// Run Alone
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<AttractionListBloc>(
        builder: (_) => AttractionListBloc(),
        child: WikiListScreen(),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
