import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Site {
  final String name;
  final String url;
  final String image;
  bool isFavorite;

  Site(
      {required this.name,
      required this.url,
      required this.image,
      this.isFavorite = false});
}

class MenuFavorite extends StatefulWidget {
  @override
  _MenuFavoriteState createState() => _MenuFavoriteState();
}

class _MenuFavoriteState extends State<MenuFavorite> {
  final List<Site> sites = [
    Site(
      name: 'Google',
      url: 'https://www.google.com',
      image: 'assets/google.png',
    ),
    Site(
      name: 'Facebook',
      url: 'https://www.facebook.com',
      image: 'assets/fb.png',
    ),
    Site(
      name: 'Twitter',
      url: 'https://www.twitter.com',
      image: 'assets/twitter.png',
    ),
    Site(
      name: 'Instagram',
      url: 'https://www.instagram.com',
      image: 'assets/ig.png',
    ),
    Site(
      name: 'GitHub',
      url: 'https://github.com/',
      image: 'assets/github.png',
    ),
    Site(
      name: 'TikTok',
      url: 'https://www.tiktok.com/',
      image: 'assets/tiktok.png',
    ),
    Site(
      name: 'WhatsApp',
      url: 'https://web.whatsapp.com/',
      image: 'assets/wa.png',
    ),
    Site(
      name: 'YouTube',
      url: 'https://www.youtube.com/',
      image: 'assets/ytb.png',
    ),
  ];

  List<Site> favoriteSites = [];

  void _toggleFavorite(int index) {
    setState(() {
      sites[index].isFavorite = !sites[index].isFavorite;
      if (sites[index].isFavorite) {
        favoriteSites.add(sites[index]);
      } else {
        favoriteSites.remove(sites[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xffDAF5FF),
            appBar: AppBar(
              backgroundColor: Color(0xff19376D),
              title: Text('Menu Situs Favorit'),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Situs'),
                  Tab(text: 'Favorit'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: sites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.network(sites[index].image),
                      title: ElevatedButton(
                        child: Text(sites[index].name),
                        onPressed: () {
                          _launchURL(sites[index].url);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          sites[index].isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: sites[index].isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            _toggleFavorite(index);
                          });
                        },
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: favoriteSites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.network(favoriteSites[index].image),
                      title: ElevatedButton(
                        child: Text(favoriteSites[index].name),
                        onPressed: () {
                          _launchURL(favoriteSites[index].url);
                        },
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
