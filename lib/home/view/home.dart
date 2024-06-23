import 'package:brainwired_interview/home/provider/home_provider.dart';
import 'package:brainwired_interview/services/check_internet/view/no_internet_screen.dart';
import 'package:brainwired_interview/utils/custom_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/check_internet/connectivity_services/connectivity_services.dart';
import '../../user_details/view/user_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the internet connectivity status from the provider.
    final connectivityStatus = Provider.of<ConnectivityStatus>(context);

    return connectivityStatus == ConnectivityStatus.connected
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Users'),
            ),
            body: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                final users = homeProvider.users;
                final loadingState = homeProvider.loadingState;
                if (loadingState == LoadingState.loading) {
                  // Display a loading indicator while fetching user data.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (loadingState == LoadingState.error) {
                  // Display an error message if user data fetching fails.
                  return const Center(
                    child: Text(
                      'Something went wrong, please try again later...',
                    ),
                  );
                } else {
                  if (users.isEmpty) {
                    // Display a message if no users are found.
                    return const Center(
                      child: Text('Users not found'),
                    );
                  } else {
                    // Display the list of users if data is successfully fetched.
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Card(
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
                      },
                      itemCount: users.length,
                    );
                  }
                }
              },
            ),
          )
        : const NoInternetScreen();
  }
}
