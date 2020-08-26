import 'package:flutter/material.dart';
import 'package:testapp_refactory/bloc/dataBloc.dart';
import 'package:testapp_refactory/model/getDataModel.dart';

class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {
    dataBloc.getData();
    return StreamBuilder(
      stream: dataBloc.data,
      builder: (context, AsyncSnapshot<GetDataModel> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[600],
              title: Text("My Applications"),
            ),
            body: ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data.data[i].name),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
