# JigSass Objects Lists
[![NPM version][npm-image]][npm-url]  [![Dependency Status][daviddm-image]][daviddm-url]   

JigSass Lists is a collection of unopinionated, unstyled, ui abstractions for displaying lists.


## Installation

Using npm:

```sh
npm i -S jigsass-objects-lists
```


## Usage

First, you would need to import JigSass Lists:
```scss
@import 'path/to/jigsass-objects-lists/scss/index';
```
And optionally [reconfigure](https://tinyurl.com/lists-config) the defaults to your liking.

Provides the following list abstractions:

  - [Bare list](https://txhawks.github.io/jigsass-objects-lists/#bare-lists): Unstyled lists.
  - [Inline list](https://txhawks.github.io/jigsass-objects-lists/#inline-lists): Inlined list items,
    placed side by side instead of stacked one on top of each other.
  - [Delimited inline list](https://txhawks.github.io/jigsass-objects-lists/#delimited-inline-lists):
    Delimited an inline item by a configurable string
  - Split inline list: Push the [first](https://tinyurl.com/split-first) or 
    [last](https://tinyurl.com/split-last) list item away from the other items, to the edge of the container
  - [Divided list](https://txhawks.github.io/jigsass-objects-lists/#divided-lists):
    A vertically stacked list of items divided by horizontal rules.

See [here](https://txhawks.github.io/jigsass-objects-lists/) for the full documentation and 
configuration options.


Like all other JigSass modules, JigSass Lists does not automatically generate any CSS when imported.
In order to use its classes, you would have to first explicitly indicate your intention to use
them, using the [jigsass-list](https://txhawks.github.io/jigsass-objects-lists/#list-mixin) mixin.
This way our css remains small and maintainable:

```scss
@include jigsass-list($list-abstraction[, $modifier, $from-brekpoint, $until-breakpoint, $misc-breakpoint]);
```

All JigSass List classes are responsive using [JigSass MQ](https://txhawks.github.io/jigsass-tools-mq/) 
and the breakpoints defined in 
`[$jigsass-breakpoints](https://txhawks.github.io/jigsass-tools-mq/#variable-jigsass-breakpoints)`.

Based on the arguments passed to the jigsass-list mixin, responsive modifiers are generated 
according to the following logic:

```scss 
.o-<list-abstraction>--modifier[-[-from-{breakpoint-name}][-until-{breakpoint-name}][-misc-{breakpoint-name}]]
```

So, assuming the `medium`, `large` and `landscape` breakpoints are defined in `$jigsass-breakpoints` 
as `600px`, `1024px` and `(orientation: landscape)` respectively,

```scss
@include jigsass-list(inline, $modifier: split-first);
```
will generate the `.o-inline-list--split-first` class, which is the default, and is not limited to any media-query.

```scss
@include jigsass-list(inline, $modifier: split-first, $until: medium);
```

will generate the `.o-inline-list--split-first--until-medium` class, which will go into effect at 
`(max-width: 37.49em)` and will override styles in the default class until that point.

```scss
@include jigsass-list(inline, $modifier: split-first, $from: large, $misc: landscape);
```

will generate the `.o-inline-list--split-first--from-large-when-landscape` class, which will go into 
effect at `(min-width: 64em) and (orientation: landscape)` and will override styles in the default 
class under these  conditions.

Regardless of how many times a class is included, or where, it will only be generated once, 
where the `jigsass-objects-items` partial was imported, leaving us with a css file as small 
as possible, and a predictable cascade.


## Contributing

It is a best practice for JigSass modules to *not* automatically generate css on `@import`, but 
rather have to user explicitly enable the generation of specific styles from the module.

Contributions in the form of pull-requests, issues, bug reports, etc. are welcome.
Please feel free to fork, hack or modify JigSass Objects Lists in any way you see fit.


#### Writing documentation

Good documentation is crucial for usability, scalability and maintainability. When 
contributing, please do make sure that both its Sass functionality (functions, mixins, 
variables and placeholder selectors), as well as the CSS it generates (selectors, 
concepts, usage exmples, etc.) are well documented.

Jigsass Grid uses Jonathan Neal's [mdcss](//github.com/jonathantneal/mdcss).

When styles and documentation comments are not automatically generated by your module on `@import`,
please use the `sgSrc/sg.scss` file to enable their generation.

In addition, any file in `sgSrc/assets` will be available for use in the style guide.

## File structure
```bash
┬ ./
│
├─┬ scss/ 
│ └─ index.scss # The module's importable file.
│
├─┬ sgSrc/      # Style guide sources
│ │
│ ├── sg.scc    # It is a best practice for JigSass 
│ │             # modules to not automatically generate 
│ │             # css and documentation on `@import.` 
│ │             # Please use this file to enable css
│ │             # and documentation comments) generation.
│ │
│ └── assets/   # Files in `sgSrc/assets` will be 
│               # available for use in the style guide
│
└─┬ docs/      # Documention
  │
  └── styleguide/ # Generated documentation 
                  # of the module's CSS
```

**License:** MIT



[npm-image]: https://badge.fury.io/js/jigsass-objects-lists.svg
[npm-url]: https://npmjs.org/package/jigsass-objects-lists

[daviddm-image]: https://david-dm.org/TxHawks/jigsass-objects-lists.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/TxHawks/jigsass-objects-lists
