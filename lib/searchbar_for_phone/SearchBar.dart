import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:material_floating_search_bar_2/material_floating_search_bar_2.dart";
Widget buildFloatingSearchBar(BuildContext context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return FloatingSearchBar(
    leadingActions: [

    ],
    height: 50,
    margins: EdgeInsets.only(
      top: 14
    ),
    border: BorderSide(
      width: 2,
      color: Colors.black
    ),
    borderRadius: BorderRadius.circular(10),
    hint: 'Search by College name, Location, Workshop, Symposium',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: 0.0,
    openAxisAlignment: 0.0,
    hintStyle: GoogleFonts.archivoBlack(),
    width: 0.4*MediaQuery.of(context).size.width,
    debounceDelay: const Duration(milliseconds: 300),
    onQueryChanged: (query) {
      // Call your model, bloc, controller here.
    },
    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: () {

          },
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:[Container(
              height: 600,
              color: Colors.white,
            )]
          ),
        ),
      );
    },
  );
}