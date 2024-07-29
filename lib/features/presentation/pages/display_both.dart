// features/presentation/pages/display_both.dart
import 'package:cat_trivia/config/pages/app_page.dart';import 'package:cat_trivia/config/pages/app_page.dart';

class DisplayBoth extends StatelessWidget {
  const DisplayBoth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Images and Facts'),
      ),
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if (state is CatInitial) {
              return const Text('Welcome!');
            } else if (state is CatLoading) {
              return const CircularProgressIndicator();
            } else if (state is CatLoaded) {
              // Save data to Hive
              var catImageBox = Hive.box<CatImage>('catImageBox');
              var catFactBox = Hive.box<CatFact>('catFactBox');
              catImageBox.put('catImage', state.catImage);
              catFactBox.put('catFact', state.catFact);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(state.catImage.url),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      state.catFact.text,
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            } else if (state is CatError) {
              // Retrieve data from Hive in case of error
              var catImageBox = Hive.box<CatImage>('catImageBox');
              var catFactBox = Hive.box<CatFact>('catFactBox');
              CatImage? catImage = catImageBox.get('catImage');
              CatFact? catFact = catFactBox.get('catFact');

              if (catImage != null && catFact != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(catImage.url),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        catFact.text,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              }

              return Text(state.message);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CatBloc>().add(FetchCat());
        },
        tooltip: 'Fetch Cat Image and Fact',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
