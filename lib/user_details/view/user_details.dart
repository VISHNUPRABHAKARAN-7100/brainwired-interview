import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/model/user_model.dart';
import '../../home/provider/home_provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final users = context.read<HomeProvider>().users;
    final user = users.firstWhere(
      (e) => e.id == id,
      orElse: () => User(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User name ${user.name ?? ''}',
        ),
      ),
      body: Center(
        child: Text(user.name ?? 'User name'),
      ),
    );
  }
}
