import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ver_detalles.dart';
import 'POKEMON.dart';
void main() => runApp(types());
class types extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Schyler',
        brightness: Brightness.light,
        primarySwatch: Colors.cyan,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Schyler',
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: typess(),
    );
  }

}
class typess extends StatefulWidget{


  @override
  search_name createState() => new search_name();


}
class search_name extends State<typess> {
  //String n;
  var url = "https://raw.githubusercontent.com/ErickJPM/pokemon/master/pokemon.json";
  PokeHub pokeHub;

  /*Metodo propio*/
  @override
  void initState() {
    super.initState();
    bajar();
  }
String _searchtype(){
    /*
    String css;
    int val;
    for(Map ){
      if (pokeHub.pokemon.where((poke)=> poke.type[val].contains(_search.text.toLowerCase())) != null){
        print("ok");
        return null;
        }
        }


     */
    }

  /*Bajar datos*/
  void bajar() async {
    var res = await http.get(url);
    print(res.body);
    var decodeJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodeJson);
    print(pokeHub.toJson());
    setState(() {

    });
  }

  String _searchText = "";
  final TextEditingController _search = new TextEditingController();
  bool _typing = false;
  String _searchText2 = "";
  final TextEditingController _search2 = new TextEditingController();
  bool _typing2 = false;
  int v = 0;

  _printTest(){
   // pokeHub.pokemon.where((poke) => poke.type.asMap().forEach((index,value) => poke);
    //pokeHub.pokemon.where((poke) => poke.type.forEach((f)=> print(f)));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: _typing ? TextField(
          autofocus: true,
          controller: _search,
          onChanged: (text) {
            setState(() {});
          },
        ):Text("Search By Type: "),
        leading: IconButton(
          icon: Icon(_typing ? Icons.done: Icons.search),
          onPressed: (){
            //_searchtype();
            print("Is typing " + _typing.toString());
            setState(() {
              _searchtype();
              _typing = ! _typing;
              _search.text="";
            });
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent[400],
      ),
      body: pokeHub == null ? Center(
        child: CircularProgressIndicator(),
      ) :
      GridView.count(crossAxisCount: 3,
        children: pokeHub.pokemon.where((poke) =>
            poke.type[0].toLowerCase().contains(_search.text.toLowerCase())).map((
            poke) =>
            Padding(padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => detalles(pokemon: poke,)
                      ));
                },
                child: Hero(
                  tag: poke.img,
                  child: Card(
                    elevation: 4.5,
                    color: Colors.deepOrangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(poke.img)
                              )
                          ),
                        ),
                        Text(poke.name,
                            style: TextStyle(fontSize: 10.0,
                              fontFamily: 'Schyler',
                              fontWeight: FontWeight.bold,)
                          // fontWeight: FontWeight.bold)
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        ).toList(),),
    );
  }
}