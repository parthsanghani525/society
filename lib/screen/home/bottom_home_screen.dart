import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListSearch(),
    );
  }
}

class ListSearch extends StatefulWidget {
  const ListSearch({Key? key}) : super(key: key);

  @override
  _ListSearchState createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  TextEditingController _textEditingController = TextEditingController();
  final List<Map<String, dynamic>> allData = [
    {"id": "1", "name": "Ram", "vehno": "GJ05AB1234"},
    {"id": "2", "name": "Roy", "vehno": "GJ05AC1111"},
    {"id": "3", "name": "Jack", "vehno": "GJ05AD1222"},
    {"id": "4", "name": "Ryan", "vehno": "GJ05SH3659"},
  ];
  List<Map<String, dynamic>> foundData = [];
  @override
  void initState() {
    foundData = allData;
    super.initState();
  }

  void runFilter(String enterVal) {
    List<Map<String, dynamic>> result = [];
    if (enterVal.isEmpty) {
      result = allData;
    } else {
      result = allData
          .where((user) =>
              user["name"].toLowerCase().contains(enterVal.toLowerCase()) ||
              user["vehno"].toLowerCase().contains(enterVal.toLowerCase()))
          .toList();
    }
    setState(() {
      foundData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: "Search...",
              labelText: "Search",
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (String val) => runFilter(val),
          ),
        ),
        Expanded(
          child: foundData.isNotEmpty
              ? ListView.builder(
                  itemCount: foundData.length,
                  itemBuilder: (context, index) => Card(
                        key: ValueKey(foundData[index]["id"]),
                        child: ListTile(
                          leading: Text(foundData[index]["id"]),
                          title: Text(foundData[index]["name"]),
                          subtitle: Text(foundData[index]["vehno"]),
                        ),
                      ))
              : Text(
                  'No results found',
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ],
    );
  }
}
