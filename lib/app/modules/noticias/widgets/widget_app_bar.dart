import 'package:desafio_gran_cursos/app/modules/shared/constants/colors.dart';
import 'package:desafio_gran_cursos/app/modules/shared/constants/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

WidgetAppBar(){
  return PreferredSize(
    preferredSize: Size.fromHeight(160),
    child: Column(
      children: [
        AppBar(
          title: Container(
            child: Row(
              children: [
                Expanded(child: Container()),
                Stack(
                  children: [
                    IconButton(icon: Icon(Icons.notifications, color: dark.withOpacity(.7),), onPressed: (){}),
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        width: 12,
                        height: 12,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: active,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: light, width: 2)
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          iconTheme: IconThemeData(color: dark),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        Container(
          height: 30,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: TabBar(
              labelColor: Colors.black54,
              unselectedLabelColor: kGrey1,
              unselectedLabelStyle: kNonActiveTabStyle,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              indicatorColor: Colors.white,
              labelStyle: kActiveTabStyle.copyWith(fontSize: 25),
              tabs: [
                Tab(text: 'Recentes',),
                Tab(text: 'Populares',),
              ]
          ),
        )
      ],
    ),
  );
}
