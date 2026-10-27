#import "template.typ": template
#show: template.with(my-title: [6. Page Setup Guide])

= Shapes
`1fr` acts like a spring in `#h()` and `#v()` pushing content to the right or bottom limit.

You can use set rule to set defaults for `#rect(), #circle(), #box()` and `#columns()` functions. Setting `#columns()` you affect page columns as well.

`#rect(width: 100%, height: 100%)` -- makes the rectangle to fill all the available space.

`#circle(radius: нlengthк)` is a function similar to `#rect()`, it also has `fill, stroke` and `inset` arguments and can wrap `[content]`.

`inset: нlengthк` is an argument of `#box(), #rect() and #circle()` that expands inner space: #box(rect(inset: 0pt)[`inset: 0pt`]) $->$ #box(rect(inset: 5pt)[`inset: 5pt`])

`нcolorк.lighten(нnumк%)` is method that makes color lighter when `нnumк` is positive and darker when `нnumк` is negative.

== Columns
`#columns(нnumberк)[content]` creates a content  divided into `нnumberк` of columns.

`#colbreak()` is like `#pagebreak()` but for columns.

`gutter: нlengthк` -- an argument of `#columns()`, `#table()` and `#grid()` setting a gap between columns.

= Pages
`#page(fill: нcolorк)` -- colors the whole page.

== Dimensions
`page.paper` can be a positional argument: `#set page("a6")`.

`#page(width: нlengthк, height: нlengthк)` -- can be used instead of `page.paper`.

`#page(margin: (inside: нlengthк, outside: нlengthк), binding: нright ∨ leftк)` -- set alternating margins.

`#page(flipped: true)` -- flips the page (changes dimensions the other way around).

== Headers and footers
`#page(numbering: нstrк)` -- makes pages numbered. The _numbering pattern_ `нstrк` can contain _counting symbols_ (e.g., `1, a, i, I`) and not. First counting symbol stands for the current page, the second -- for the total amount of pages. Not counting ones are displayed as they are.

`#page(..., number-align: нv-align + <h-align>)` puts the numbering into header or footer.

`#page(header: [...], footer: [...])` -- make custom header and footer (suppress the previous 2 arguments). Use code block for fine-tuning: #align(center)[```typst
...header: context {
    let ...
    if ... [...]
    ...}
```]
`#page(..., header-ascent: нlengthк, footer-descent: нlengthк)` -- push header/footer away from a margin edge. The `нlengthк` can be relative `нnumк%` meaning percent of margin.

= Advanced programming
`#str(нnumк)` -- takes a number and returns a string. A string can be used in tables and grids as well as `[...]`.

`#(...)` -- allows operations with arrays:
- `#(("x",) + ("y",))` $->$ #(("x",) + ("y",))
- `#(3 * ("x",))` $->$ #(3 * ("x",))

`.join(...)` -- concatenates arrays with argument between elements:
- `#("a", "b", "c").join()` $->$ #("a", "b", "c").join()
- `#("a", "b", "c").join("-")` $->$ #("a", "b", "c").join("-")
- `#("a", "b", "c").join(h(1em))` $->$ #("a", "b", "c").join(h(1em))

`.any(x => <condition with x>)` -- `true` if at least one element satisfies the condition, `false` otherwise:
- `#(1, 2, 3).any(num => num < 2)` $->$ #(1, 2, 3).any(num => num < 2)
- `#(1, 2, 3).any(hui => hui >= 5)` $->$ #(1, 2, 3).any(hui => hui >= 5)

`#let (нname1к, нname2к, нname3к...) = (нval1к, нval2к, нval3к...)` -- allows to declare several variables at once:

#box[
- `#let (a,) = (2,)`
  - `#a` $->$ 2
] #h(2em)
#box[
- `let (a1, a2, a3) = ("I", "love", "you")`
  - `#a1` $->$ "I"; `#a2` $->$ "love", `#a3` $->$ "you"
]

`.first()` -- returns first element of an array:
- `#(3, 2, 1).first()` $->$ 3

If body of `#for` creates an array in each iteration, `#for` concatenates all these arrays. The array can be spread with `..for`:
- `#for x in (1, 2, 3) {(x, x*2)}` $->$ #for x in (1, 2, 3) {(x, x*2)}
- `#table(columns: 4,
..for x in (1, 2, 3, 4){(str(x),)})` $->$ #h(0.5em) #box[#table(columns: 4, ..for x in (1, 2, 3, 4) {(str(x),)})]

`#context` is used with things that require "introspection". `#context` can be used before a code block `{...}` which contains such a thing.

/ Counter: A data type for numbered sequences. Can belong to pages, headings, figures. Counters are not arrays!
/ Location: A data type representing a place in the document.
/ Element: A kind of content that can be labeled. Every element has a location.

`#context query(<label>)` -- returns an array of elements labeled by the label.

`нelementк.location()` -- returns a location of the element.

`#context here()` -- returns location of this place.

`нlocationк.page()` -- returns page of the location (doesn't depend on page counter).

`#counter(page)` -- returns counter of the current page.

`.get()` -- transforms a counter into an array.

`.at(нlocationк)` -- like `.get` but looks at the value of counter in the location.

`.update(нnumк)` -- switches counter to the number. `.update(нclosureк)` -- switches counter according to the closure.

To display page numbering in a custom footer/header, we can use `#context counter(page).display(нpattern stringк, both: true)`

= Questions
+ How to turn a number into string?
+ Explain the role of `#()`
+ Explain the result of the code: `#let (a, ) = ("a",)`
+ What's the role of `1fr` in `#h()` and `#v()`?
+ How can we make new defaults for: `#rect, #circle(), #box(), #columns()`? For each of the functions tell possible new defaults.
+ Will `#set columns(...)` affect the columns generated by `#set page(columns...)`?
+ Explain `#pagebreak()` function.
+ How to make a rectangle to fill all the available space?
+ Explain `#circle()` function.
+ Explain `inset: ...` argument of functions.
+ Explain `gutter: ...` argument of functions. 
+ Explain `.lighten()` method.
+ Explain `#columns()` function.
+ Explain `#colbreak()` function.
+ How to choose color of the page?
+ Which argument of `#page()` is positional?
+ How to make a page of custom dimensions?
+ Explain `binding: ...` argument.
+ Explain `inside: ...` and `outside: ...` sub-arguments.
+ Explain `#page(numbering: ...)` argument. Explain numbering pattern string.
+ Why `#page(numbering: "Page 1 of 1")` argument won't work as intended? How to achieve the desired effect?
+ Explain `number-align: ...` argument.
+ Explain `header: ...` and 'footer: ...' arguments.
+ Find and explain what's wrong: ```typst
#page("a6",
  numbering: "1",
  number-align: top + right,
  header: align(left)[#context document.title]
)[...]
```
+ How a code block can help us fine-tune behavior of headers and footers.
+ Explain `header-ascent: ...` and `footer-descent: ...` arguments. Which two different types of values they can take? How each of the types works?
+ Explain `#str()` function.
+ Find the output of the code:
  - `#(("x",) + ("y",))`
  - `#(3 * ("x",))`
+ Explain `.join()` method.
+ Explain `.any()` method.
+ How to declare several variables with one `#let`?
+ Explain `.first()` method.
+ Explain the result of the code: 
  - `#for x in (1, 2, 3) {(x, x*2)}`
  - ```typst #table(columns: 4,
..for x in (1, 2, 3, 4){(str(x),)})```
+ What is required when Typst needs "introspection" of the documents?
+ Explain the functionality of `#context {...}` construction.
+ What are a counter, a location and an element as Typst entities?
+ Explain `query()` function.
+ Explain `.location()` method.
+ Explain `here()` function.
+ Explain `.page()` method,.
+ Explain `#counter(page)`.
+ Explain `.get()` and `.at()`.
+ Explain `.update()`.
+ Explain .display().
+ Explain `flipped: ...` argument.