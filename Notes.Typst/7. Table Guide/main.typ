#import "template.typ": template
#let my-line = box[#line(length: 100%)]

#show: template.with(my-title: [7. Table Guide])
= New terms

#show table.cell.where(x: 0): set align(center + horizon)
#show table.cell.where(x: 2): set align(left + top)
#show table.cell.where(x: 1): set par(justify: true)
#set table(stroke: (x: none))
#table(
  columns: 3,
  table.header[*Term*][*Definition*][*Examples*],
  [_Sides dictionary_], [a dictionary with `x, y, top, bottom, right, left, rest` keys], [`(x: 1cm)` | `(left: red, bottom: 2pt + blue)`],
  [_Joined value_], [a value produced by combining values of different type with `+` operator], [`1pt+red` | `bottom + center`],
  [_Binding_], [creating an association between a name and an entity], [ `#let a = 2` | `#let square(a) = a*a` |  `#let (.., x) = ("22", "13", "14")`],
  [_Discarding_], [pattern matching where we use underscore or `..` to intentionally ignore certain values without binding them to variables], [`#let (x, ..) = (1, 2, 3)` | `(_, y) => y-1`],
  [_CSV_], [comma-separated values; a format for table representation --  one row per line with the cells separated by commas], [`Name, Score` \ `Ann, 90` \ `Bob, 95`]
) 


= Table arguments
#table(
  align: left,
  columns: 2,
[#par(justify: true)[Each table cell have (x, y) coordinates. We can use this coordinates in binary closure or `table.cell.where(x: <n>)` and `.where(y: <n>)` selectors.]],
  table(
    columns: 4,
    stroke: (x: 1pt),
  [0, 0], [1, 0], [2, 0], [3, 0],
  [0, 1], [1, 1], [2, 1], [3, 1], 
  [0, 2], [1, 2], [2, 2], [3, 2], 
  [0, 3], [1, 3], [2, 3], [3, 3],  
  [0, 4], [1, 4], [2, 4], [3, 4], 
))
Most table arguments can accept several forms of values:
#table(
  columns: (auto, auto, auto),
  [*Form of value*], [*Description*], [*Examples*],
  [_Single value_], [applies to everything], [`fill: red | align: right + horizon | stroke: none `],
  [_Array_], [applies iteratively #my-line behaves differently depending on the argument (by columns as default)], [`fill: (red, blue, green) | align: (left, right) | gutter: (1pt, 3pt, 0pt)`],
  [_Sides dictionary_], [applies to cell sides #box[#line(length: 100%)] can take binary closure as sub-argument], [`inset: (x: 4pt, bottom: 3pt) | stroke: (top: none, rest: red)`],
  [_Binary closure_], [applies to conditionally specified cells, must return one of the above types], [`(_, y) => if y == 0 {none}` | `(x, y) => if x > 3 or y < 4 {horizon} else {bottom} + if x < 6 {left} else {right}`]
)

`#if false` without `else` evaluates to `none` which some arguments (`fill, stroke`) accept but others (`align, inset`) do not.

== `columns`
- `auto` is the default size.

== `fill`
- an array cycles by columns.
- takes `none`.

== `stroke`
- an array cycles by columns.
- allows joined values `<color> + <length>`.
- allows `none` and sides dictionary.
- cell to the right or below overrides neighbor's stroke.

== `inset`
- controls padding inside the sells.
- can be given as relative length (`em`, `%`) in any form (array, side dictionary, etc.)

== `gutter`, `row-gutter`, `column-gutter`
- take length and push cells away from each other.
- array keep the last element till the end.
- `row-gutter` array iterates by rows.


== align
- an array cycles by columns.

= Table elements
== `table.header` and `table.footer`
- can wrap several content blocks: `[...][...][...]...`
- repeat at the beginning/end of a page when table splits unless `(repeat: false)`.
- cannot be accessed thru their own `#show` selectors, use `table.cell.where(y: <num>)` instead.

== `table.cell`
- produces and sets a single cell.
- has some table arguments, overriding them: `fill, stroke, align, inset`.
- `colspan: <num>` and `rowspan: <num>` arguments make the cell span across several columns/rows. The settings of the first cell in the span are applied.
- can be a selector for `#show` and adjusted thru `#set`.

== `table.hline` and `table.vline`
- produce a _hand-placed line_ independent from _grid-line_ of `table.stroke`.
- have `stroke` argument controlling width and color.
- have `y: <num>` and `x: <num>` arguments respectively to place them not where they are written. `x: 0` is the leftmost line, `y:0` is the topmost.
- have `start: <num>` and `end: <num>` arguments, where `<num>` is a cell coordinate.
- can be adjusted thru `#set`.

= Programming
Logical operators #text(fill: blue)[`or`], #text(fill: blue)[`not`], #text(fill: blue)[`and`] behave as you expect.

You can refer to a variable in itself: `#let x = x + 1`.

#my-line
`#(...)` evaluates an expression in markup: `#(1 + 2)` $->$ #(1 + 2). 
  #par(justify: true)[`#{...}` allows to scope definitions and `#set` rules and even use definitions and multiple steps in closures: ]

#grid(
  stroke: none,
  column-gutter: 1em,
  columns: (auto, 1fr),
  box[```
  #(1, 2, 3).map(x => {
    let double = x * 2
    double + 1
  })```], align(horizon)[$-->$ #h(1em) (3, 5, 7)]
)

== `calc` helpers
- `#float(<str>)` turns a string into number: `#float("228")` $->$ 228.
- `#calc.odd(<num>)` and `#calc.even(<num>)` -- `true` when the number is odd/even.
- `#calc.rem(<num1>, <num2>)` -- returns the remainder of dividing the first number by the second: `#calc.rem(7, 2)` $->$ 1.
- `#calc.round(<num1>, digits: <num2>)` -- rounds `<num1>` to `<num2>` digits after dot: `#calc.round(3.145454, digits: 2)` $-> #calc.round(3.145454, digits: 2)$.
- `#calc.log(<num>)` -- returns logarithm of `<num>` (base 10 by default), the base can be specified with `base:` argument:
  - `#calc.log(1000)` $-> 3$;
  - `#calc.log(1000, base: 2)` $-> #calc.log(1000, base: 2)$.

== Arrays
Array indexes begin from 0.

- `<array>.at(<num>)` -- returns an array element with index `num`: \ #align(center)[`#(1, 2, 3).at(0)` $->$ 1]
This can be used to cycle array by rows:
#align(center)[`fill: (_, y) => (red, green, yellow).at(calc.rem(y, 3))`]

- `.flatten()` -- unnest nested arrays into 1-level array:
#align(center)[`#(1, (2, 3, (4,))).flatten()` $->$ #(1, (2, 3, (4,))).flatten()]

- `.slice(<num>)` -- throws away all elements with index below `num`,
- `.slice(<num1>, <num2>)` -- throws away all elements with index below `num1` and $>=$ than `num2`:
#align(center)[
`#("a", "b", "c", "d", "e").slice(3)` $->$ #("a", "b", "c", "d", "e").slice(3) \
`#("a", "b", "c", "d", "e").slice(2, 3)` $->$ #("a", "b", "c", "d", "e").slice(2, 3) \
The number of items you get is always $mono("num2" - "num1")$.]

- `#csv("file.csv")` turns the file into 2-level array where 1st level is rows and the 2nd -- cells of a row in string form: \ #align(center)[`(("This", "Is", "Row", "1"),` \ `("This", "is", "second", "1"), ...)`]

- Here are some destructuring techniques:
  #align(center)[#grid(columns: 2, align: horizon, box[`#let (_, b, _, d) = (1, 2, 3, 4)` $==>$], box[` #b` $->$ 2 \ ` #d` $->$ 4])]
  #align(center)[#grid(columns: 2, align: horizon, box[`#let (a, b, ..) = (1, 2, 3, 4)` $==>$], box[` #a` $->$ 1 \ ` #b` $->$ 2])]
  #align(center)[#grid(columns: 2, align: horizon, box[`#let (.., a, b, c) = (1, 2, 3, 4, 69)` $==>$], box[` #a` $->$ 3 \ ` #b` $->$ 4 \ `  #c` $->$ 69])]

= Content wrappers
== `#rotate(...)[...]`
- takes angle value `<num>deg` or `<num>rad` as positional argument. Positive  `num` rotates clockwise.
- can take `reflow:` `true` makes rotation affect layout.
== `#figure(...)[...]`
  - takes `placement:` `top/bottom/none/auto` argument that moves it across page.
  - puts its content inside a block, that makes the content unbreakable
    - a table inside a figure cannot span across pages
    - to change it, use `#show figure: set block(breakable: true)`
== `#grid()`
- `table` is for data, `grid` is for layout.
- have the same arguments as `#table`
- have different defaults: no strokes, no inset
- have the same sub-elements: `grid.cell`, `grid.hline`, `grid.vline`

= Questions
+ What is a sides dictionary? Give examples.
+ What is a joined value? Give examples.
+ What is binding? Give examples.
+ What is discarding? Give examples?
+ What is CSV? Give an example.
+ For each cell in the empty table give its coordinates: #align(center, table(columns: 5, rows: 5, stroke: 1pt))
+ How to access all the cells with `y` or `x` coordinate equal to a specific number thru `#show` rule?
+ Explain using single value as `#table` argument.
+ Explain using array as `#table` argument.
+ Explain using sides dictionary as `#table` argument.
+ Explain using binary closure as `#table` argument.
+ Can we mix the above forms of values? If yes, give examples, if no, explain why.
+ What will `#if <condition> {<expression>}` return if the `condition` is false? Where is this mechanism useful? Where does it cause problems?
+ What is default size of table column?
+ How does `fill: ` argument work with an array? How does it work with `none`? How does it work with sides dictionary?
+ How does `stroke: ` argument work with an array? How does it work with `none`? How does it work with sides dictionary?
+ How does `align: ` argument work with an array? How does it work with `none`? How does it work with sides dictionary?
+ What kind of joined value can `stroke: ` argument receive?
+ What does `inset: ` argument do? Which values can it take in terms of type and form?
+ Explain `gutter: ` argument. Which values can it take in terms of type and form? How does it work with an array?
+ The same question for `row-gutter` and `column-gutter` arguments.
+ Explain `table.header` and `table.footer` elements.
+ Where do `table.header` and `table.footer` repeat themselves? How to switch off the repetition.
+ How to access `table.header` or `table.footer` thru `#show` rule.
+ Explain `table.cell` element. Which arguments does it take? How to adjust it thru `#set` and `#show`? 
+ How to make a cell span over several rows/columns?
+ Explain `table.hline` and `table.vline`.
+ Can we change `table.hline` and `table.vline` via `#set` and `#show` rules?
+ Explain difference between hand-placed lines and grid-lines.
+ Explain `stroke`, `x` and `y`, `start` and `end` arguments of table lines.
+ Which logical operators does Typst use for $or, and "and" not$?
+ How to adjust a variable using the variable recursively?
+ Which delimiters are used to evaluate an expression (e.g., 2*2 ) in markup?
+ How to scope definitions and `#set` rules?
+ #box[Fix a bug: #align(center)[
```
  #(1, 2, 3).map(x => 
    let double = x*2
    double + 1)
```]]
+  How to convert strings like `"333", "4", "61"` into numbers?
+ Explain `#calc.odd`, `calc.even`, `calc.rem`, `#calc.round`, `#calc.log`.
+ Where do array indexes begin from?
+ Explain `reflow:` argument.
+ Explain `<array>.at()` method?
+ How to make an array (for example an array of colors in `fill:` argument) cycle by rows instead of columns?
+ Explain `.flatten()` method.
+ Explain `.slice()` method.
+ Explain `#csv` function.
+ Explain destructuring with `_` and with `..`
+ What is the output of `#(1, 2, 3).at(1)`
+ Explain `#rotate` function?
+ Explain `placement: ` argument of `#figure`.
+ Why cannot a table span across pages when inside a figure? How to fix it?
+ Explain `#grid` function. What's its fundamental difference from `#table`? Which arguments it takes, what are defaults of these arguments?
+ What're grid's analogs of `table.cell, table.hline` and `table.vline`?
  dd
