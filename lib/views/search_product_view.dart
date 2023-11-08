import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistory {
  static final SearchHistory _instance = SearchHistory._internal();
  factory SearchHistory() => _instance;

  SearchHistory._internal();

  List<String> searchs = [];
}

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  TextEditingController searchController = TextEditingController();
  SearchHistory searchHistory = SearchHistory();

  @override
  void initState() {
    super.initState();
    searchController.text = '';
    _loadSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedSearchs = prefs.getStringList('searchHistory');
    if (savedSearchs != null) {
      setState(() {
        searchHistory.searchs = savedSearchs;
      });
    }
  }

  Future<void> _saveSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('searchHistory', searchHistory.searchs);
  }

  @override
  void dispose() {
    _saveSearchHistory();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SizedBox(
              width: deviceWidth * .80,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                  top: 10.0,
                ),
                child: TextFormField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Buscar',
                    contentPadding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                  ),
                  onFieldSubmitted: (String value) {
                    setState(() {
                      if (searchHistory.searchs.length >= 10) {
                        searchHistory.searchs.removeAt(0);
                      }
                      searchHistory.searchs.add(value);
                    });
                    print(value);
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //     SearchedProduct(
                    //       productName: value,
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.search),
            title: Text(
              searchHistory.searchs[index],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    searchHistory.searchs.removeAt(index);
                  });
                }),
            onTap: () {
              setState(
                () {
                  searchController.text = searchHistory.searchs[index];
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => SearchedProduct(
                  //       productName: searchHistory.searchs[index],
                  //     ),
                  //   ),
                  // );
                },
              );
            },
          );
        },
        itemCount: searchHistory.searchs.length,
      ),
    );
  }
}
