import 'package:comida/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetalheScreen extends StatelessWidget {
  final Function(Meal) onToglleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetalheScreen({
    Key? key,
    required this.onToglleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  _createSelectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title),
    );
  }

  _createSectionContainer(Widget child) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.titulo!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imagemUrl!,
                fit: BoxFit.cover,
              ),
            ),
            _createSelectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.ingredients!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Text(meal.ingredients![index]),
                      ),
                    );
                  }),
            ),
            _createSelectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.steps!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '${index + 1}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 70, 132),
                          ),
                          title: Text(meal.steps![index]),
                        ),
                        const Divider(thickness: 1),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onToglleFavorite(meal);
        },
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
