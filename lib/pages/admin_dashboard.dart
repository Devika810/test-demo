import 'package:flutter/material.dart';
import '../api/visitor_api.dart';


class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: FutureBuilder(
        future: VisitorAPI.getAllVisitors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data: ${snapshot.error}'));
          } else if (snapshot.data is! List) {
            return Center(child: Text('Invalid data format'));
          } else {
            final visitorList = snapshot.data as List<dynamic>? ?? [];
            if (visitorList.isEmpty) {
              return Center(child: Text('No visitors found'));
            }
            return ListView.builder(
              itemCount: visitorList.length,
              itemBuilder: (context, index) {
                final visitor = visitorList[index];
                final visitorName = visitor['name'] ?? 'Unknown';
                final visitorReason = visitor['reason'] ?? 'No reason provided';
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(visitorName),
                    subtitle: Text('Reason: $visitorReason'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}