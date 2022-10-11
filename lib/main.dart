import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.compact,
        primarySwatch: Colors.blue,
        canvasColor: Colors.grey.shade50,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
      ),
      home: const HomePage(),
      // add text scaling factor
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.9);
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: scale), child: child!);
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const Text(
                  "World",
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
            const Icon(Icons.language),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.4,
        ),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 12.0,
                  ),
                ],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: constraints.maxWidth,
                      width: constraints.maxWidth,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                        "https://picsum.photos/id/237/200/200",
                      ))),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Ex occaecat aute voluptate",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "120.00",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
