import 'package:clean_code_architechture/data/response/status.dart';
import 'package:clean_code_architechture/utils/routes/routes_name.dart';
import 'package:clean_code_architechture/view_model/movies_list_view_model.dart';
import 'package:clean_code_architechture/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  MoviesList_ViewModel moviesList_ViewModel = MoviesList_ViewModel();

  @override
  void initState() {
    // TODO: implement initState
    moviesList_ViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                userPreferences.remove().then((value) {
                  Navigator.pushNamed(context, RouteNames.login);
                });
              },
              child: Icon(Icons.logout)),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => moviesList_ViewModel,
        child: Consumer<MoviesList_ViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Image.network(value
                                  .moviesList.data!.movies![index].posterurl
                                  .toString()),
                              Text(
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                  value.moviesList.data!.movies![index].title
                                      .toString())
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              default:
                Text('error');
            }
            return Container(
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
