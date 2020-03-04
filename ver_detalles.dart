import 'package:flutter/material.dart';
import 'POKEMON.dart';


class detalles  extends StatelessWidget{
  final Pokemon pokemon;
  detalles({this.pokemon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text(pokemon.name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        centerTitle:  true,
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height/1.5,
            width: MediaQuery.of(context).size.width-20,
            left: 10.0,
            top: MediaQuery.of(context).size.height*0.12,
            child: Card(
              elevation: 6.5,
              color: Colors.lightGreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(pokemon.name, style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  Text('Height: ${pokemon.height}' ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  Text('Weight: ${pokemon.weight}' ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  Text('Types: ', style: TextStyle(fontWeight: FontWeight.bold),),
                  Wrap(
                   // mainAxisAlignment:  MainAxisAlignment.spaceAround,
                    children: pokemon.type.map((t)=> FilterChip(
                      backgroundColor: Colors.amber,
                      label: Text(t,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),), onSelected: (b){},
                    )).toList(),
                  ),
                  /*Evoluciones*/
                  Text('Evolutions: ', style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceAround,
                    children: pokemon.nextEvolution.map((t)=> FilterChip(
                      backgroundColor: Colors.blueAccent,
                      label: Text(t.name,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),), onSelected: (b){},
                    )).toList(),
                  ),
                  Text('Weaknesses: ', style: TextStyle(fontWeight: FontWeight.bold),),
                  Wrap(
                   // mainAxisAlignment:  MainAxisAlignment.spaceAround,
                    children: pokemon.weaknesses.map((t)=> FilterChip(
                      backgroundColor: Colors.purple,
                      label: Text(t,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),), onSelected: (b){},
                    )).toList(),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(tag:  pokemon.img,
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pokemon.img)
                )
              ),
            ),),
          )
        ],
      ),
    );
  }

}