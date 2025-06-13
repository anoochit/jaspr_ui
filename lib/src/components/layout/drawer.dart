// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_ui/jaspr_ui.dart';

import '../navigation/menu.dart';

/// A flexible and customizable drawer component for web applications using Jaspr.
///
/// The [Drawer] class creates an interactive sidebar navigation system with
/// multiple configuration options. It supports:
/// - Positioning the drawer on the left or right side of the screen
/// - Controlling the initial open/closed state
/// - Customizable content and sidebar elements
///
/// The drawer uses a checkbox-based toggle mechanism, which allows for
/// pure CSS-driven interactions without requiring JavaScript.
///
class Drawer extends StatelessComponent {
  /// Determines the positioning of the drawer.
  final bool drawerEnd;

  /// Controls the initial open state of the drawer.
  final bool open;

  /// A unique identifier for the drawer.
  ///
  /// Used to connect the drawer toggle checkbox with the drawer overlay.
  /// Must be unique across the application to prevent conflicts.
  final String id;

  /// The main content of the page when the drawer is open or closed.
  ///
  /// Typically contains the primary page layout or components that
  /// remain visible regardless of the drawer's state.
  final List<Component> content;

  /// The sidebar content to be displayed when the drawer is open.
  ///
  /// Can include navigation menus, additional controls, or any custom components.
  final List<Component> sidebar;

  final bool lgOpen;

  /// Constructs a [Drawer] with required configuration parameters.
  ///
  /// [drawerEnd] determines the drawer's side positioning.
  /// [open] sets the initial open/closed state.
  /// [id] provides a unique identifier for the drawer.
  /// [content] defines the main page content.
  /// [sidebar] specifies the sidebar content.
  ///  [lgOpen] specifies open drawer in large screen.
  Drawer({
    this.drawerEnd = false,
    this.open = false,
    this.id = 'drawer',
    required this.content,
    required this.sidebar,
    this.lgOpen = true,
  });

  /// Builds the drawer component with all its interactive elements.
  ///
  /// Constructs a drawer with:
  /// - A hidden checkbox for toggling the drawer
  /// - Main content area
  /// - Sidebar with an overlay for closing
  ///
  /// Applies responsive classes to handle different screen sizes and states.
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      // Combine drawer classes with conditional positioning and state classes
      classes: 'drawer ${lgOpen == true ? 'lg:drawer-open' : ''} '
          '${drawerEnd == true ? 'drawer-end' : ''} '
          '${open == true ? 'drawer-open' : ''} ',
      [
        // Checkbox input for drawer toggle (hidden)
        input(
            id: id, type: InputType.checkbox, classes: 'drawer-toggle', []),

        // Main content area
        div(classes: 'drawer-content min-h-screen', content),

        // Sidebar and overlay
        div(
          classes: 'drawer-side',
          [
            // Overlay label for closing the drawer
            label(
                classes: 'drawer-overlay',
                attributes: {'for': id, 'aria-label': 'close sidebar'},
                []),
            // Spread sidebar components
            ...sidebar,
          ],
        ),
      ],
    );
  }
}

/// A responsive drawer button component for mobile navigation.
///
/// [DrawerButton] provides a convenient way to toggle the drawer
/// on smaller screen sizes. It's typically hidden on larger screens
/// and appears as a circular button with an icon.
///
class DrawerButton extends StatelessComponent {
  /// The ID of the drawer this button controls.
  ///
  /// Must match the [id] of the corresponding [Drawer] component.
  final String id;

  /// CSS class for the icon to be displayed in the button.
  ///
  /// Allows for flexible icon customization through CSS classes.
  final Component icon;

  // Hide item on large screem
  final bool lgHidden;

  /// Constructs a [DrawerButton] to toggle a specific drawer.
  ///
  /// [id] links the button to a specific drawer.
  /// [icon] defines the visual icon for the button.
  DrawerButton({
    super.key,
    this.id = 'drawer',
    required this.icon,
    this.lgHidden = true,
  });

  /// Builds the drawer toggle button.
  ///
  /// Creates a circular, ghost-styled button that:
  /// - Is only visible on mobile breakpoints
  /// - Uses a label to trigger the drawer toggle
  /// - Includes a custom icon
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield label(
        // Styling and responsive visibility classes
        classes:
            'btn btn-circle btn-ghost drawer-button ${lgHidden == true ? 'lg:hidden' : ''}',
        attributes: {
          'type': 'checkbox',
          'for': id,
          'aria-label': 'open sidebar'
        },
        [
          // Render the icon using the provided icon class
          icon
        ]);
  }
}

/// A vertical menu component designed for sidebar navigation.
///
/// [SidebarMenu] creates a structured, vertically aligned menu
/// with customizable menu items. It's typically used within a [Drawer]
/// to provide navigation options.
///
class SidebarMenu extends StatelessComponent {
  /// List of menu items to be displayed in the sidebar.
  ///
  /// Each [MenuItem] represents a clickable navigation option
  /// with a label and optional action.
  final List<Component> items;

  /// Constructs a [SidebarMenu] with a list of menu items.
  ///
  /// [items] defines the navigation options in the sidebar.
  SidebarMenu({super.key, required this.items});

  /// Builds the sidebar menu component.
  ///
  /// Creates a vertically aligned group of menu items with:
  /// - Predefined styling for background and text
  /// - Fixed width and padding
  /// - Vertical menu alignment
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield GroupMenu(
      children: items,
      // Vertical alignment with base styling
      align: MenuAlign.vertical,
      style: 'bg-base-200 text-base-content min-h-full w-80 p-4',
    );
  }
}
