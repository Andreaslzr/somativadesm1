import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Marea - Hospedagens"),
          ),
          body: ListView(
            children: [
              Destino("Angra dos Reis", "imagens/angra.jpg", 384, 70,
                  "Venham conhecer os peixes nesse mar lindo e cristalino."),
              Destino("Arraial do Cabo", "imagens/arraial.jpg", 571, 65,
                  "Venham conhecer nossas belas praias."),
              Destino("Florianópolis", "imagens/floripa.jpg", 348, 85,
                  "Venha se ospedar a beira mar."),
              Destino("Jericoacoara", "imagens/Jericoacoara.jpg", 571, 75,
                  "Venham desfrutar de nossas dunas deslumbrantes e águas cristalinas."),
              Destino("Madri", "imagens/madri.jpg", 401, 85,
                  "Venham assistir o maior classico do mundo, REAL X BARÇA."),
              Destino("Paris", "imagens/paris.jpg", 546, 95,
                  "Venham comer nosso maravilhoso croissant."),
              Destino("Orlando", "imagens/orlando.jpg", 616, 105,
                  "Venham estudar em hogwarts STUDIOS UNIVERSAL."),
              Destino("Roma", "imagens/roma.jpg", 478, 85,
                  "Venham conhecer uma das 7 maravilhas do mundo."),
              Destino("Las Vegas", "imagens/vegas.jpg", 504, 110,
                  "O que você faz em Vegas, fica em Vegas."),
              Destino("Chile", "imagens/chile.jpg", 446, 95,
                  "Venham conhecer a famosa ILHA DE PÁSCOA."),
            ],
          )),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome_d;
  final String img;
  final String descricao;
  int valord = 0;
  int valorp = 0;
  Destino(this.nome_d, this.img, this.valord, this.valorp, this.descricao,
      {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_diarias = 0;
  int n_pessoas = 0;
  int total = 0;

  void _dias() {
    setState(() {
      n_diarias++;
    });
  }

  void _pessoas() {
    setState(() {
      n_pessoas++;
    });
  }

  void _calctotal() {
    setState(() {
      total = (n_diarias * widget.valord) + (n_pessoas * widget.valorp);
    });
  }

  void _limpar() {
    setState(() {
      n_diarias = 0;
      n_pessoas = 0;
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            width: 393,
            height: 250,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(
            "${widget.nome_d}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "R\$ ${widget.valord}/dia - R\$ ${widget.valorp}/pessoa",
            style: TextStyle(
                fontSize: 30, color: Colors.deepPurpleAccent.shade700),
          ),
          Text(
            " Descrição: ${widget.descricao}",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  width: 300,
                  height: 30,
                  child: Text(
                    "Quantidade de dias: $n_diarias",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _dias, child: Icon(Icons.add)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  color: Colors.white,
                  width: 300,
                  height: 50,
                  child: Text(
                    "Quantidade de pessoas: $n_pessoas",
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _pessoas, child: Icon(Icons.add)),
            ],
          ),
          Container(
            color: Colors.white,
            width: 300,
            height: 40,
            child: Text(
              "Valor Total R\$: $total",
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                ),
                ElevatedButton(onPressed: _calctotal, child: Text("Calcular")),
                ElevatedButton(onPressed: _limpar, child: Text("Limpar")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
