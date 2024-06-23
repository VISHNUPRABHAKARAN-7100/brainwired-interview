import 'package:flutter/material.dart';
import '../../../user_details/view/user_details.dart';
import '../../model/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserDetails(
              id: user.id ?? 0,
            ),
          ),
        ),
        leading: CircleAvatar(
          child: Text(
            user.id?.toString() ?? 'User ID',
          ),
        ),
        title: Text(user.name ?? 'Name'),
        subtitle: Text(user.email ?? 'email'),
      ),
    );
  }
}
