import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  List<int> imagesIds = [1, 2, 3, 4, 5];

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // scrollController.position.pixels es la posicion actual del scroll
      // scrollController.position.maxScrollExtent es la posicion maxima del scroll
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Nota: más arriba hemos definido la bandera isLoading, esto es ya que cuando estemos llegando al final y se cumpla esta condición del if, se estaría lanzando muchas
        // veces la opetación dentro del if, o sea el loadNextPage(), entonces isLoading (dentro de loadNextPage) nos permite determinar que si ya se esta leyendo el contenido
        // para la siguientes slides, entonces no realizar la carga

        // Load Next Ppage
        loadNextPage();
      }
    });
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));
    addFiveImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});

    modeScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    if (!isMounted) return;

    isLoading = false;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void modeScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 60,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    isMounted =
        false; // El dispose se llama cuando el componente va a ser destruido, o ya esta destruido, en este punto hacemos false el isMounted,
    // o sea el componente no está montado, lo que nos permite que al hacer la carga en loadNextPage, no realizarla
    // si el widget aún no estámontado. Esto lo hacemos ya que loadNextPage es una función asíncrona, que dado el caso de que si nos salimos del
    // la vista, y en ese momento se estaba realizando la carga asíncrona, y se lanza el setState [último setState que tenemos dentro de la funcion
    // loadNextPage], entonces estaríamos lanzando un setState de un componente que ya no existe, lo que puede hacer que la aplicación
    // falle (crash).

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage('assets/Images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        onPressed: () => context.pop(),
        child:
            isLoading
                ? SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh_rounded),
                )
                : FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
