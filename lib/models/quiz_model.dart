import 'package:flutter/material.dart';

class Question {
final String questionText;
final List<Answer> answersList;
final String imagePath;
final String hint;

Question(this.questionText, this.answersList, this.imagePath, this.hint);
}

class Answer {
final String answerText;
final bool isCorrect;

Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
List<Question> list = [];

list.add(Question(
"Remplacer les lignes manquantes par le code nécessaire pour que la fonction renvoie la somme des deux arguments a et b. \n \n public static int calculateSum(int a, int b) { \n int sum = a + b; \n return _________; \n}",
[
Answer("sum", true),
Answer("a + b", false),
Answer("ab", false),
],
"assets/images/robot1.png",
"Pensez à retourner la variable 'sum' qui contient la somme de a et b.",
));

list.add(Question(
"Comment déclare-t-on une fonction en Python ?",
[
Answer("def function_name():", true),
Answer("function function_name():", false),
Answer("define function_name():", false),
],
"assets/images/robot2.png",
"Utilisez le mot-clé 'def' suivi du nom de la fonction et des parenthèses.",
));

list.add(Question(
"Quel est le symbole utilisé pour les commentaires en Python ?",
[
Answer("//", false),
Answer("/*", false),
Answer("#", true),
Answer("--", false),
],
"assets/images/robot3.png",
"Utilisez le symbole '#' pour les commentaires en Python.",
));

list.add(Question(
"Comment imprime-t-on 'Hello World' en Python ?",
[
Answer("console.log(Hello, World!)", false),
Answer("print(Hello, World!)", true),
Answer("log(Hello World!)", false),
],
"assets/images/robot4.png",
"Utilisez la fonction 'print' suivie de la chaîne de caractères 'Hello World'.",
));

list.add(Question(
"Comment utilise-t-on la méthode range() pour générer une liste de nombres de 1 à 10 ?",
[
Answer("range(1, 10)", false),
Answer("range(10)", false),
Answer("range(1, 11)", true),
Answer("range(0, 10)", false),
],
"assets/images/robot5.png",
"Utilisez la fonction 'range' avec les arguments '1' et '11' pour générer une liste de nombres de 1 à 10.",
));

return list;
}