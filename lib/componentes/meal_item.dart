import 'package:comida/models/meal.dart';
import 'package:comida/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItem extends StatelessWidget {
  final Meal? meal;

  const MealItem({Key? key, this.meal}) : super(key: key);

  void _selectMeal(context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.mealDetalhe,
      arguments: meal,
    )
        .then((result) {
      if (result == null) {
        debugPrint('Sem Resultado');
      } else {
        debugPrint('O nome da refeição é $result.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // child: Text(meal!.titulo as String),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  meal!.imagemUrl!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    meal!.titulo as String,
                    style:
                        GoogleFonts.pacifico(fontSize: 26, color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.schedule),
                  const SizedBox(
                    width: 6,
                  ),
                  Text('${meal!.duracao} min'),
                ],
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  const Icon(Icons.work),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(meal!.textoComplexo),
                ],
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(meal!.textoCusto),
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
