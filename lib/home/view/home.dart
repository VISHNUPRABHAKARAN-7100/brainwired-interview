import 'package:brainwired_interview/home/provider/home_provider.dart';
import 'package:brainwired_interview/services/check_internet/view/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/check_internet/connectivity_services/connectivity_services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the internet connectivity status from the provider.
    final connectivityStatus = Provider.of<ConnectivityStatus>(context);

    return connectivityStatus == ConnectivityStatus.connected
        ? SafeArea(
            child: Scaffold(
              body: Consumer<HomeProvider>(
                builder: (context, homeProvider, child) => FutureBuilder(
                  future: homeProvider.fetchUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Display a loading indicator while fetching user data.
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      // Display an error message if user data fetching fails.
                      return Center(
                        child: Text(
                          'Failed to fetch users: ${snapshot.error}',
                        ),
                      );
                    } else if (!snapshot.hasData ||
                        homeProvider.users.isEmpty) {
                      // Display a message if no users are found.
                      return const Center(
                        child: Text(
                          'No users found',
                        ),
                      );
                    } else {
                      // Display the list of users if data is successfully fetched.
                      return ListView.builder(
                        itemCount: homeProvider.users.length,
                        itemBuilder: (context, index) {
                          final user = homeProvider.users[index];
                          return ListTile(
                            title: Text(user.name ?? 'No Name'),
                            subtitle: Text(user.email ?? 'No Email'),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          )
        : const NoInternetScreen();
  }
}
