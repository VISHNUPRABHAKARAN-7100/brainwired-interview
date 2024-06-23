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
    // Retrieves the size of the device screen.
    final screenWidth = MediaQuery.of(context).size.width;
    final users = context.read<HomeProvider>().users;
    final user = users.firstWhere(
      (e) => e.id == id,
      orElse: () => User(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name ?? '',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: screenWidth,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name ?? 'User name'),
                  Text(user.username ?? 'Username'),
                  Text(user.email ?? 'Email'),
                  Text(
                    '${user.address?.street}, ${user.address?.suite}, ${user.address?.city}',
                  ),
                  Text(user.phone ?? 'Phone'),
                  Text(user.website ?? 'Website'),
                  Text(user.company?.name ?? 'Company name'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
