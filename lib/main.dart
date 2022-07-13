import 'package:e_book_bloc_app/data/data.dart';
import 'package:e_book_bloc_app/logic/logic.dart';
import 'package:e_book_bloc_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  BooksRepository booksRepository = BooksRepository();
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(booksRepository: booksRepository)),
    storage: storage,
  );
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
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
        ],
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Fire E-Book',
              debugShowCheckedModeBanner: false,
              theme: state.switchValue
                  ? ThemeData(
                      primarySwatch: Colors.amber,
                      fontFamily: 'futura',
                      brightness: Brightness.dark,
                    )
                  : ThemeData(
                      primarySwatch: Colors.amber,
                      fontFamily: 'futura',
                      brightness: Brightness.light,
                    ),
              home: const MainPage(),
            );
          },
        ),
      ),
    );
  }
}
