enum Complexidade { simples, media, dificil }

enum Custo { barato, justo, cara }

class Meal {
  final String id;
  final List<String>? categoria;
  final String? titulo;
  final String? imagemUrl;
  final List<String>? ingredients;
  final List<String>? steps;
  final int? duracao;
  final bool? semGluten;
  final bool? semLactose;
  final bool? vegetariana;
  final bool? vegana;
  final Complexidade? complexidade;
  final Custo? custo;

  const Meal({
    required this.id,
    this.categoria,
    this.titulo,
    this.imagemUrl,
    this.ingredients,
    this.steps,
    this.duracao,
    this.semGluten,
    this.semLactose,
    this.vegetariana,
    this.vegana,
    this.complexidade,
    this.custo,
  });

  String get textoComplexo {
    switch (complexidade) {
      case Complexidade.simples:
        return 'Simples';
      case Complexidade.media:
        return 'Normal';
      case Complexidade.dificil:
        return 'Dificil';
      default:
        return 'Desconhecido';
    }
  }

  String get textoCusto {
    switch (custo) {
      case Custo.barato:
        return 'Barato';
      case Custo.justo:
        return 'Justo';
      case Custo.cara:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
