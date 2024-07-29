import 'package:cat_trivia/config/pages/app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final catService = CatService(dio);
  final factService = FactServices(dio);

  await Hive.initFlutter();
  Hive.registerAdapter(CatImageAdapter());
  Hive.registerAdapter(CatFactAdapter());
  await Hive.openBox<CatImage>('catImageBox');
  await Hive.openBox<CatFact>('catFactBox');

  runApp(MyApp(
    catRepository: CatRepository(catService),
    factRepository: FactRepository(factService),
  ));
}

class MyApp extends StatelessWidget {
  final CatRepository catRepository;
  final FactRepository factRepository;

  const MyApp({
    super.key,
    required this.catRepository,
    required this.factRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatBloc(
            catService: catRepository.catService,
            factService: factRepository.factServices,
          )..add(FetchCat()),
        ),
      ],
      child: MaterialApp(
        title: 'Cat Images and Facts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DisplayBoth(),
      ),
    );
  }
}
