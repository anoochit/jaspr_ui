// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jaspr/jaspr.dart';

import '../../colors/background_colors.dart';
import '../../icons/fa_brands.dart';
import '../navigation/link.dart';
import '../utils/icon.dart';

/// A customizable footer component that allows setting background color and child components.
///
/// The [Footer] class creates a footer element with optional background color
/// and a list of child components. It extends [StatelessComponent] and yields
/// a footer element with specified classes and children.
///
/// Example usage:
/// ```dart
///Footer(
///  children: [
///    FooterSidebarLogo(
///      logo: div(classes: 'fas fa-hashtag text-4xl', []),
///      line1: p([text('Cdipisicing voluptate id.')]),
///      line2: p([text('Ut elit nulla exercitation officia deserunt.')]),
///    ),
///    FooterNav(
///      title: 'Services',
///      items: [
///        FooterNavItem(title: 'Title', href: '#'),
///        FooterNavItem(title: 'Title', href: '#'),
///        FooterNavItem(title: 'Title', href: '#'),
///        FooterNavItem(title: 'Title', href: '#'),
///      ],
///    ),
///    FooterNav(
///      title: 'Company',
///      items: [
///        FooterNavItem(title: 'Title', href: '#'),
///        FooterNavItem(title: 'Title', href: '#'),
///        FooterNavItem(title: 'Title', href: '#'),
///        FooterNavItem(title: 'Title', href: '#'),
///      ],
///    ),
///    FooterNav(
///      title: 'Legal',
///      items: [
///        FooterNavItem(title: 'Title', href: '#'),
///        FooterNavItem(title: 'Title', href: '#'),
///      ],
///    ),
///    FooterSidebarSocial(
///      facebook: '',
///      twitter: '',
///      youtube: '',
///    ),
///  ],
///);
/// ```
class Footer extends StatelessComponent {
  /// Optional background color for the footer.
  final BackgroundColor backgroundColor;

  /// List of child components to be rendered inside the footer.
  final List<Component> children;

  /// Constructs a [Footer] with optional key and background color.
  ///
  /// [key] is an optional identifier for the footer.
  /// [backgroundColor] determines the background color of the footer.
  /// [children] are the components to be displayed in the footer.
  Footer({
    super.key,
    this.backgroundColor = BackgroundColor.base300,
    required this.children,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer(
      classes: 'footer text-base-content p-10 '
          '${backgroundColor.className} ',
      children,
    );
  }
}

/// Represents a navigation section within a footer.
///
/// [FooterNav] creates a navigation element with a title and a list of navigation items.
/// It generates text links based on the provided [FooterNavItem] list.
///
/// Example usage:
/// ```dart
/// FooterNav(
///   title: 'Quick Links',
///   items: [
///     FooterNavItem(title: 'Home', href: '/'),
///     FooterNavItem(title: 'About', href: '/about')
///   ]
/// )
/// ```
class FooterNav extends StatelessComponent {
  /// Title of the navigation section.
  final String title;

  /// List of navigation items to be displayed.
  final List<FooterNavItem> items;

  /// Constructs a [FooterNav] with a required title and list of items.
  ///
  /// [key] is an optional identifier for the navigation component.
  /// [title] is the heading text for the navigation section.
  /// [items] are the individual navigation links.
  FooterNav({super.key, required this.title, required this.items});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav([
      h6(classes: 'footer-title', [
        text(title),
      ]),
      ...List.generate(items.length, (i) {
        final item = items[i];
        return TextLink(
          title: item.title,
          href: item.href,
          type: LinkType.hover,
        );
      }),
    ]);
  }
}

/// Represents a single navigation item within a footer navigation section.
///
/// [FooterNavItem] holds the title and href for a single navigation link.
///
/// Example usage:
/// ```dart
/// FooterNavItem(title: 'Contact', href: '/contact')
/// ```
class FooterNavItem {
  /// The display text for the navigation item.
  String title;

  /// The destination URL for the navigation item.
  String href;

  /// Constructs a [FooterNavItem] with required title and href.
  ///
  /// [title] is the text displayed for the link.
  /// [href] is the URL the link points to.
  FooterNavItem({
    required this.title,
    required this.href,
  });
}

/// A sidebar logo component for the footer.
///
/// [FooterSidebarLogo] displays a logo with two additional text lines.
///
/// Example usage:
/// ```dart
/// FooterSidebarLogo(
///   logo: someLogoComponent,
///   line1: text('Company Name'),
///   line2: text('Tagline')
/// )
/// ```
class FooterSidebarLogo extends StatelessComponent {
  /// The logo component to be displayed.
  final Component logo;

  /// First additional text line.
  final Component line1;

  /// Second additional text line.
  final Component line2;

  /// Constructs a [FooterSidebarLogo] with required logo and text components.
  ///
  /// [key] is an optional identifier for the logo component.
  /// [logo] is the main logo component.
  /// [line1] is the first text line below the logo.
  /// [line2] is the second text line below the logo.
  FooterSidebarLogo(
      {super.key,
      required this.logo,
      required this.line1,
      required this.line2});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield aside([
      logo,
      line1,
      line2,
    ]);
  }
}

/// A social network links component for the footer.
///
/// [FooterSidebarSocial] creates a navigation section with social media links.
///
/// Example usage:
/// ```dart
/// FooterSidebarSocial(
///   title: 'Follow Us',
///   facebook: 'companypage',
///   twitter: 'companyhandle',
///   youtube: 'channelname'
/// )
/// ```
class FooterSidebarSocial extends StatelessComponent {
  /// Title of the social network section.
  final String title;

  /// Facebook username or page identifier.
  final String? facebook;

  /// Twitter/X username.
  final String? twitter;

  /// YouTube channel name.
  final String? youtube;

  /// TikTok username (optional, not used in current implementation).
  final String? tiktok;

  /// Github name.
  final String? github;

  /// Constructs a [FooterSidebarSocial] with optional social media links.
  ///
  /// [key] is an optional identifier for the component.
  /// [title] defaults to 'Social Network' if not provided.
  /// [facebook], [twitter], [youtube], and [tiktok] are optional social media identifiers.
  FooterSidebarSocial({
    super.key,
    this.title = 'Social Network',
    this.facebook,
    this.twitter,
    this.youtube,
    this.tiktok,
    this.github,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav([
      h6(classes: 'footer-title', [
        text(title),
      ]),
      div(classes: 'grid grid-flow-col gap-4', [
        if (facebook != null)
          a(
            href: 'https://www.facebook.com/$facebook',
            [Icon(icon: FaBrands.facebook_f)],
          ),
        if (twitter != null)
          a(
            href: 'https://x.com/$twitter',
            [Icon(icon: FaBrands.twitter)],
          ),
        if (youtube != null)
          a(
            href: 'https://www.youtube.com/@$youtube',
            [Icon(icon: FaBrands.youtube)],
          ),
        if (github != null)
          a(
            href: 'https://github.com/$github',
            [Icon(icon: FaBrands.github)],
          )
      ]),
    ]);
  }
}

class FooterWithCopyrightText extends StatelessComponent {
  final String company;

  FooterWithCopyrightText({
    required this.company,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer(classes: 'footer footer-center bg-base-300 p-4', [
      aside([
        p([
          text(
              'Copyright © ${DateTime.now().year} - All right reserved by $company')
        ])
      ])
    ]);
  }
}

class FooterWithCopyrightSocialIcons extends StatelessComponent {
  final String company;
  final Icon icon;
  final String? facebook;
  final String? twitter;
  final String? youtube;
  final String? tiktok;
  final String? github;

  FooterWithCopyrightSocialIcons({
    required this.company,
    required this.icon,
    this.facebook,
    this.twitter,
    this.youtube,
    this.tiktok,
    this.github,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer(classes: 'footer p-10 bg-base-300 items-center', [
      aside(classes: 'grid-flow-col items-center', [
        icon,
        p([
          text(
              'Copyright © ${DateTime.now().year} - All right reserved by $company')
        ])
      ]),
      nav(
          classes:
              'grid-flow-col gap-4 md:place-self-center md:justify-self-end',
          [
            if (facebook != null)
              a(
                href: 'https://www.facebook.com/$facebook',
                [Icon(icon: FaBrands.facebook_f)],
              ),
            if (twitter != null)
              a(
                href: 'https://x.com/$twitter',
                [Icon(icon: FaBrands.twitter)],
              ),
            if (youtube != null)
              a(
                href: 'https://www.youtube.com/@$youtube',
                [Icon(icon: FaBrands.youtube)],
              ),
            if (github != null)
              a(
                href: 'https://github.com/$github',
                [Icon(icon: FaBrands.github)],
              )
          ])
    ]);
  }
}

class FooterCenteredWithCopyrightSocialIcons extends StatelessComponent {
  final String company;
  final Icon icon;
  final String? facebook;
  final String? twitter;
  final String? youtube;
  final String? tiktok;
  final String? github;

  FooterCenteredWithCopyrightSocialIcons({
    required this.company,
    required this.icon,
    this.facebook,
    this.twitter,
    this.youtube,
    this.tiktok,
    this.github,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer(
      classes: 'footer footer-center p-10 bg-base-300',
      [
        aside([
          icon,
          p(classes: 'font-bold', [text(company)]),
          p([text('Copyright © ${DateTime.now().year} - All right reserved.')])
        ]),
        nav([
          div(classes: 'grid grid-flow-col gap-4', [
            if (facebook != null)
              a(
                href: 'https://www.facebook.com/$facebook',
                [Icon(icon: FaBrands.facebook_f)],
              ),
            if (twitter != null)
              a(
                href: 'https://x.com/$twitter',
                [Icon(icon: FaBrands.twitter)],
              ),
            if (youtube != null)
              a(
                href: 'https://www.youtube.com/@$youtube',
                [Icon(icon: FaBrands.youtube)],
              ),
            if (github != null)
              a(
                href: 'https://github.com/$github',
                [Icon(icon: FaBrands.github)],
              )
          ])
        ])
      ],
    );
  }
}
