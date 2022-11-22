import 'package:dio_library/webservice.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> _fetchData;

  @override
  void initState() {
    _fetchData = WebService.getData();
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("butona basıldı");
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder<List<User>>(
          future: _fetchData, //WebService.getData(),
          builder: (context, snaphot) {
            if (snaphot.hasData) {
              var users = snaphot.data!;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      subtitle: Text(users[index].address.toString()),
                      title: Text(
                        users[index].email,
                      ),
                    );
                  });
            } else if (snaphot.hasError) {
              return Center(child: Text(snaphot.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
