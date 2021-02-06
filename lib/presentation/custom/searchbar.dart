import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/styles.dart';

class SearchResult extends StatelessWidget {
  final String name;
  SearchResult({this.name});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchList extends StatefulWidget {
  SearchList({Key key, this.name}) : super(key: key);
  static const String routeNamed = 'search';

  final String name;

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = Text(
    "",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<SearchResult> _list;
  bool _IsSearching;
  String _searchText = "";
  String selectedSearchValue = "";

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    createSearchResultList();
  }

  void createSearchResultList() {
    _list = <SearchResult>[
      SearchResult(name: 'Javascript'),
      SearchResult(name: 'React'),
      SearchResult(name: 'Vue.js'),
      SearchResult(name: 'Dart'),
      SearchResult(name: 'Flutter'),
      SearchResult(name: 'Python'),
      SearchResult(name: 'Django'),
      SearchResult(name: 'Figma'),
      SearchResult(name: 'Photoshop'),
      SearchResult(name: 'C++'),
      SearchResult(name: 'Ruby'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.PRIMARY_CREAM,
        key: key,
        appBar: buildBar(context),
        body: Stack(
          children: <Widget>[
            Container(
              height: 300.0,
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: ListView(
                  children: <Widget>[],
                ),
              ),
            ),
            displaySearchResults(),
          ],
        ));
  }

  Widget displaySearchResults() {
    if (_IsSearching) {
      return Align(alignment: Alignment.topCenter, child: searchList());
    } else {
      return Align(alignment: Alignment.topCenter, child: Container());
    }
  }

  ListView searchList() {
    List<SearchResult> results = _buildSearchList();
    return ListView.builder(
      itemCount: _buildSearchList().isEmpty == null ? 0 : results.length,
      itemBuilder: (context, int index) {
        return Container(
          decoration: BoxDecoration(
              color: Styles.PRIMARY_CREAM,
              border:
                  Border(bottom: BorderSide(color: Styles.COFFEE, width: 0.5))),
          child: ListTile(
            onTap: () {},
            title: Text(results.elementAt(index).name,
                style: TextStyle(fontSize: 18.0)),
          ),
        );
      },
    );
  }

  // List<SearchResult> _buildList() {
  //   return _list.map((result) =>  SearchResult(name: result.name)).toList();
  // }

  List<SearchResult> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((result) => SearchResult(name: result.name)).toList();
    } else {
      List<SearchResult> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        SearchResult result = _list.elementAt(i);
        if ((result.name).toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(result);
        }
      }
      return _searchList
          .map((result) => SearchResult(name: result.name))
          .toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.TAN,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: appBarTitle,
      actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: () {
            _displayTextField();
          },
        ),
      ],
    );
  }

  void _displayTextField() {
    setState(() {
      if (this.actionIcon.icon == Icons.search) {
        this.actionIcon = Icon(
          Icons.close,
          color: Styles.WHITE,
        );
        this.appBarTitle = TextField(
          autofocus: true,
          controller: _searchQuery,
          style: TextStyle(
            color: Styles.WHITE,
          ),
        );

        _handleSearchStart();
      } else {
        _handleSearchEnd();
      }
    });
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Styles.WHITE,
      );
      this.appBarTitle = Text(
        "",
        style: TextStyle(color: Styles.WHITE),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}
