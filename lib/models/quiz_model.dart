class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "remplacer les lignes manquantes par le code nécessaire pour que la fonction renvoie la somme des deux arguments a et b. \n \n public static int calculateSum(int a, int b) { \n int sum = a + b; \n return _________; \n}",
    [


      Answer("sum", true),
      Answer("a + b", false),
      Answer("ab",false ),

    ],
  ));

  list.add(Question(

    "Comment déclare-t-on une fonction en Python ?",
    [
      Answer("def function_name():", true),
      Answer("function function_name():", false),
      Answer("define function_name():", false),
    ],
  ));

  list.add(Question(
    "Quel est le symbole utilisé pour les commentaires en Python ?",
    [
      Answer("//", false),
      Answer("/*", false),
      Answer("#", true),
      Answer("--", false),
    ],
  ));

  list.add(Question(


    "Comment imprime-t-on " "Hello World" "en Python ?",
    [
      Answer("console.log(Hello, World!)", false),
      Answer("print(Hello, World!)", true),
      Answer("log(Hello World!)", false),

    ],
  ));

  list.add(Question(


    "Comment utilise-t-on la méthode range() pour générer une liste de nombres de 1 à 10 ?",
    [
      Answer("range(1, 10)", false),
      Answer("range(10)", false),
      Answer("range(1, 11)", true),
      Answer("range(0, 10)", false),


    ],
  ));

  return list;
}

