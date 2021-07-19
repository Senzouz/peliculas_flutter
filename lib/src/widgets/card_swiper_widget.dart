import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            peliculas[index].uniqueID = '${peliculas[index].id}-tarjeta';

            return Hero(
              tag: peliculas[index].uniqueID,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detalle',
                      arguments: peliculas[index]),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.gif'),
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          itemCount: peliculas.length,
          itemWidth: _screenSize.width * 0.6,
          itemHeight: _screenSize.height * 0.4,
          layout: SwiperLayout.STACK,
        ));
  }
}
