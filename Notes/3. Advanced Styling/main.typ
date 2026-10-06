#set document(title: [3. Advanced Styling])
#set page(
  paper: "a5",
  numbering: "1"
)

#title()
#outline()
= A show rule
```typst #show <object>: <function>``` applies the function to all the objects. To specify a subcategory of the object, you can use the method ```typst <object>.where(<property>: <value>)```. Examples:

- ```typst #show title: smallcaps``` -- makes title be in small caps. 
- ```typst #show heading: set align(center)``` -- makes headings centered.
- ```typst #show heading.where(level: 2): set text(…)``` -- sets font of 2nd-level headings.

In ```typst #show ...: <var> =>...``` you can use the same `<var>` for different `#show`; it's local.

= New settings
== `#document(...)`
- `title: [text]` or `title: "text"` -- gives its value to the `#title()`.
- `author: "text"`
== `#page(...)`
- ```typst paper: "us-letter"``` -- so-called "US Letter" paper size, analog of A4.
- ```typst header: [<content>]``` -- sets a header (a note at the top of the page):
  - ```typst header: align(…)[<content>]``` -- aligns the header.
- ```typst numbering: <string>``` -- controls page numbers:
  - ```typst numbering: "1"``` -- standard numbering: 1, 2, 3...
  - ```typst numbering: "a"``` -- a, b, c...
  - ```typst numbering: "(1/1)"``` -- (`<current page>/<how many pages>`).
- ```typst columns: <number>``` -- divides text into columns.
== `#text(...)`
- ```typst weight: <string>```
  - `"bold"`
  - `"regular"`
- ```typst style: <string>```
  - `"italic"`

== `#align(...)`
- ```typst #align(horizon)``` -- vertical centering.
== (fill: ...)
- `fill: <color>` -- colors the object:
  - ```typst #text(fill: red)``` -- red text.
  - ```typst #rect(fill: black)``` -- black rectangle.

= New functions
== `#grid(...)`
*Grid* is a basic table without lines, e.g.: #h(0.2em) #box[
  #grid(
    columns: 2,
    [A#h(0.5em)#v(0.3em)], [B],
    [C], [D]
  )
] \
The arguments of the function:
- `columns: <...>` -- sets columns:
  - `columns: <number>` -- several columns with auto-width.
  - `columns: (<length_1>, <length_2>, ...)` -- the first column with `<length_1>`, the second with `<length_2>`, etc.
#block(above: 0.7em)[Use a relative length `fr` to divide all available width proportionally.]
- `align: <...>` -- aligns columns:
  - `align: center` -- all columns are centered.
  - `align: (left, center, right, ...)` -- 1st column left-aligned, 2nd centered, 3rd right, etc.

- [`<content>`] -- creates a cell.
  - `align(…)[<content>]` -- aligning of an individual cell.

== `#box(...)[...]`
Most objects, except paragraphs, are placed into `#box`. It allows us to control gaps before and after an object: ```typst #show <object>: set box(before: <length>, after: <length>)```.

== `#place(...)[...]`
The function places content at the top or bottom of a page regardless of other content. Its arguments are:
- `<alignment>` -- e.g., ```typst #place(top + center, ...)```
- `float: true` -- switches on the collision with other content.
- `scope: "parent"` -- puts the content outside current columns (across the whole page).
- `clearance: <length>` -- a gap before or after.

== `#link(<string>)`
- `#link("https://www.example.com/")` #sym.arrow #link("https://www.example.com/").
- `#link("https://www.example.com/")[*Clickable text*]` #sym.arrow #link("https://www.example.com/")[*Clickable text*].
- `#link("www.example.com/")` #sym.arrow.r.not the link is broken, a protocol required.
- `#link("mailto:example@gmail.com")` #sym.arrow a link to an email.

== `#context`
`#context <element>.<property>` -- outputs the property's value, e.g.:
- `#context text.size` #sym.arrow #context text.size.
- `#context document.title` #sym.arrow #box[#context document.title].

== `<...>.body`
Returns plain text of an element, without counters, boxing, or formatting:
- ```typst #show heading: it => it.body``` #sym.arrow the headings become plain text.
- ```typst #context document.title.body``` #sym.arrow #context document.title.body.

== Small commands
- `#h(<length>)` -- horizontal gap.
- `#v(<length>)` -- vertical gap.
- `\` -- new line.
- `// <comment>`
- `/* <comment> */`

= Delimiters
*Hyphenation* is enabled when `#par(justify: true)`, otherwise it's off.

*Quick way* to put a text into *"…"*, *(…)*, *[…]*, or *{…}*, is to type it plain, then select it and type the delimiter.

- (…) -- hold arguments of a function.
  - code mode #sym.arrow no `#` and markups allowed.
  - `#<function>()` means the function receives nothing.
  - can hold content in 2 (often equivalent) forms: `"<text>"` and `[<content>]`.
- […] -- hold content,
  - markup mode #sym.arrow `#` is required.
  - `#<function>[]` means the function receives something (empty content block).
  - often isn't necessary (syntactic sugar), because the content can go to (…), e.g.:` #place(top, rect()) = #place(top)[#rect()]`.
  - determine a scope, hence *empty scope* command *`#[…]`*.
- {…} -- hold code block.
  -  code mode #sym.arrow no `#` and markups allowed.
  - allow to span code across multiple lines.
  - different lines of a code block concatenate with each other: #grid(
  columns: 3,
  align: horizon,
  [`it.body + [.]`], [#h(1em)=#h(1em)],
  [#box[`{it.body` \
  `[.]}`]]
)

= Questions:
+ Explain `#show <object>: <function>` rule. Explain `#show <object>: set <…>` rule.
+ Explain `.where(…)` method.
+ How to make a text smallcap?
+ Can we use the same `<var>` in different `#show <…>: <var> =>...` rules?
+ Explain `title:` and `author:` arguments. Which values do they take? Which function do they belong to? How do they interact with `#title` command?
+ What's US Letter? How to make our pages have it?
+ What's the difference between header and heading?
+ How to make pages of a document to have headers? How to align a header?
+ Why are these arguments of `#page` not correct: `numbering: 1`, `numbering: a`, `numbering: (1/1)`. Which effect do their correct versions have?
+ How to divide pages into columns using `#set`?
+ Explain `weight:` and `style:` arguments. Which values do they take? Which function do they belong to?
+ Explain the difference between `center` and `horizon`.
+ Explain the `fill:` argument. Which values does it take? Which functions does it belong to?
+ Explain `#rect` function.
+ Explain `#grid` function. What does it produce? Which arguments does it take?
+ How to make a grid of several columns without any specified widths? How to divide all available space between several columns in some proportion? How to make a grid of several columns, each with specific width?
+ How to align all the grid the same way at once? How to align a grid by the columns? How to align an individual cell of a grid?
+ What's `fr`? Why do we call it a relative length?
+ Which function do `[ ]` play in the `#grid`?
+ What's the `#box`? What does `#show <...>: set box(...)` allows us to control and how?
+ Explain `#place` function. By explain I always mean syntax and functionality.
+ Explain `float:`, `scope:` and `clearance:` arguments. Which values do they take? Which function do they belong to?
+ Explain `#link` function. How to display a clickable link to a site in the document? How to make a clickable text linked to a site? How to make a link to an email?
+ Find errors:
  - `#link(https://www.example.com/)`
  - `#link("www.example.com/")`
  - `#link("mailto: example@gmail.com")`
+ Explain `#context` function and `<...>.body` method
+ Explain the commands:
  - `#[...]`
  - `#h`
  - `#v`
  - `\`
  - `//`
  - `/*...*/`
+ What's the link between hyphenation and justification?
+ If you already typed some text, what's the easy/alternative way to put it inside delimiters such as `[], "", {}, ()`?
+ Explain main functionality of each `(), []` and `{}`. Which of them are code mode? Which of them allows `#` inside?
+ What's the difference between `#<function>()` and `#<function>[]`?
+ Why is `[]` often just a syntactic sugar?
+ Does `[]` determine its own scope? What does it even mean?
+ Which of the two forms is correct: `("text")` or `([<text>])`?
+ New line ends code execution. But what if I want to span code across several lines?
+ How to concatenate two strings if they are: a) on the same line; \ b) on different lines?