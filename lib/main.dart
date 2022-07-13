import 'package:e_book_bloc_app/data/data.dart';
import 'package:e_book_bloc_app/logic/logic.dart';
import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BooksRepository booksRepository = BooksRepository();
  runApp(MyApp(booksRepository: booksRepository));
}

class MyApp extends StatelessWidget {
  final BooksRepository booksRepository;

  const MyApp({Key? key, required this.booksRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BooksRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavigationBarCubit(),
          ),
          BlocProvider(
            create: (context) => BooksBloc(booksRepository: booksRepository)
              ..add(GetBooksEvent()),
          ),
          BlocProvider(
            create: (context) =>
                RequestedBookBloc(booksRepository: booksRepository),
          ),
          BlocProvider(
            create: (context) => SearchBloc(booksRepository: booksRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Fire E-Book',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.amber,
            fontFamily: 'futura',
          ),
          home: const MainPage(),
        ),
      ),
    );
  }
}
