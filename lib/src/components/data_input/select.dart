import 'package:jaspr/jaspr.dart';

class Select extends StatelessComponent {
  final List<SelectOption> options;
  final dynamic value;
  final ValueChanged? onChange;
  final bool border;
  final SelectColor? color;
  final SelectSize? size;
  final bool? disabled;

  Select(
      {super.key,
      required this.options,
      required this.value,
      this.onChange,
      this.border = false,
      this.color,
      this.size,
      this.disabled});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield select(
        classes: 'select '
            '${border == true ? 'select-bordered' : ''} '
            '${color != null ? color!.className : ''} '
            '${size != null ? size!.className : ''} '
            'w-full max-w-xs',
        onChange: (value) => onChange?.call(value),
        disabled: disabled,
        List.generate(options.length, (i) {
          final item = options[i];
          final ktitle = item.title;
          final kvalue = item.value;
          final kdisabled = item.disabled;
          return option(
            label: ktitle,
            value: kvalue,
            selected: (value == kvalue),
            disabled: kdisabled,
            [],
          );
        }));
  }
}

class SelectOption {
  String title;
  dynamic value;
  bool disabled;
  SelectOption({
    required this.title,
    required this.value,
    this.disabled = false,
  });
}

enum SelectSize {
  xs('select-xs'),
  sm('select-sm'),
  md('select-md'),
  lg('select-lg');

  const SelectSize(this._className);
  final String _className;
  String get className => _className;
}

enum SelectColor {
  primary('select-primary'),
  secondary('select-secondary'),
  accent('select-accent'),
  neutral('select-neutral'),
  info('select-info'),
  success('select-success'),
  warning('select-warning'),
  error('select-error');

  const SelectColor(this._className);

  final String _className;

  String get className => _className;
}
