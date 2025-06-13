import 'package:jaspr/jaspr.dart';

List<Component> daisyUiStyles = [
  // daisy ui 5
  link(
    href: "https://cdn.jsdelivr.net/npm/daisyui@5",
    rel: "stylesheet",
    type: "text/css",
  ),

  // tailwindcss 4
  script(
    src: "https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4",
    [],
  ),
  link(
    href: "https://cdn.jsdelivr.net/npm/daisyui@5/themes.css",
    rel: "stylesheet",
    type: "text/css",
  ),

  // fontawesome
  link(
    rel: 'stylesheet',
    href:
        'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css',
  ),
];
