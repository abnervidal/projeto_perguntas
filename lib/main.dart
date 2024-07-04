import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': '1-Qual a sua cor favorita?',
      'respostas': [
        {'texto':'Preta',   'pontuacao':10},
        {'texto':'Vermelho','pontuacao':5},
        {'texto':'Verde',   'pontuacao':3},
        {'texto':'Branco',  'pontuacao':1},
      ]
    },
    {
      'texto': '2-Qual é o seu animal favorito?',
      'respostas': [
        {'texto':'Coelho',   'pontuacao':5},
        {'texto':'Cobra',    'pontuacao':3},
        {'texto':'Elefante', 'pontuacao':1},
        {'texto':'Leão',     'pontuacao':10},
      ]
    },
    {
      'texto': '3-Você gosta de quem?',
      'respostas': [
        {'texto':'Maria', 'pontuacao':3},
        {'texto':'João',  'pontuacao':1},
        {'texto':'Leo',   'pontuacao':10},
        {'texto':'Pedro', 'pontuacao':5},
      ]
      }
  ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
      print(_pontuacaoTotal);
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
  
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const SizedBox(
            width: double.infinity,
            child: Text(
            'Perguntas',
            textAlign: TextAlign.center,
            ),
          ),
        ),
        body: temPerguntaSelecionada 
          ? Questionario(
            perguntas: _perguntas,
            perguntaSelecionada: _perguntaSelecionada,
            quandoResponder: _responder,
          ) 
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
    const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
