import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/providers/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.getCharacteres();
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rick and Morty",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: apiProvider.characteres.isNotEmpty
              ? CharacterList(
                  apiProvider: apiProvider,
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, required this.apiProvider});

  final ApiProvider apiProvider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: apiProvider.characteres.length,
        itemBuilder: (contect, index) {
          final character = apiProvider.characteres[index];
          return GestureDetector(
              child: Card(
            child: Text(character.name!),
          ));
        });
  }
}
