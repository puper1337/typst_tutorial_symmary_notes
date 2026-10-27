#set page(
  paper: "a5",
  margin: (x: 2em, y: 2em),
)
#set text(
  size: 14pt,
)
#title("2. Formatting")
= Formatting functions
`#<func>(<key: value list>)[content]`:
- The parentheses are for settings; the list is in code mode #sym.arrow no `#` is allowed.
- The brackets are for whatever is affected by the settings, they are in markup mode #sym.arrow `#` is required for a function.

Here are some functions of such a form with some of their settings:
- *`text`* -- sets font family, size, color, etc. of the text.
  - `font: "<fontname>"`
  - `size: <number>pt`
- *`page`* -- sets page size, margins, headers, enable columns and footers.
  - `paper: "a5"`
  - `margin: (<key: value list>)`
    - `x: <length>`
    - `y: <length>`
    - `left: <length>`
    - `right: <length>`
    - `top: <length>`
    - `bottom: <length>`
- *`par`* -- sets paragraph justification, line spacing, etc.
  - `justify: true`
  - `leading: <length>` -- space between lines
- *`heading`* -- sets the appearance of headings and enable numbering.
  - `numbering: <string>` -- can use letters, roman numerals and symbols.
    - "1." #sym.arrow 1. ... 1.1. ... 1.2. ... 2. ... 3.2. ...
    - "1.a" #sym.arrow 1. ... 1.a ... 1.b ... 2. ... 3.b ...
- *`document`* -- sets the PDF metadata, such as title and author.
- *`align`*
  - `<horizontal alignment>`, e.g., center
  - `<vertical alignment>`, e.g., `bottom`
  - The alignments can be combined with `+` sign.

To affect formatting of all the following document, use *`#set <function>(...)`*.

*`#show <element>: <var> => ...#<var>...`* change all occurrences of the `<element>` (now represented by `<var>`) in the document into the `...#<var>...` To affect a text, use `#show "<text>"...`

= Offtop tips
- `#lorem(<number>)` produces `<number>` words of dummy text.
- To turn autocomplete panel off, use `Esc`. To turn it on, use `Ctrl + Space`.
- `em` is a relative length equal to the current font size. 
- `#image(height: <length>, ...)` produces an image of specified height.
- Use `#box` to prevent undesired line breaks, e.g., `#box[#box(image(...)) <text>]`.

= Questions
+ Suppose a function has this form: `#<func>(...)[...]`. What goes into (...) and [...] respectively? Where we use `#` and where we don't, and why so?
+ Explain each functions:
  - `text`
  - `page`
  - `par`
  - `heading`
  - `document`
  - `align`
+ Explain each argument. Which function it belongs to, what does it control, which values does it take?
  - `font`
  - `size`
  - `paper`
  - `margin`
  - `justify`
  - `leading`
  - `numbering`
  - center
  - bottom
+ When we combine two arguments with `+`?
+ Explain the `#set` construction.
+ Explain the `#show` construction.
+ Explain the `#lorem` function.
+ Explain the `em` unit.
+ How to make an image have a certain height?
+ Explain the following construction: `#box[#box(image(...)) <text>]`.
+ How to turn autocomplete panel on and off?
+ Explain in terms of functions, function arguments and argument values:
  - How to switch font to New Computer Modern?
  - How to switch font to 14pt?
  - How to change page size to A5?
  - How to make horizontal margins 1.5 centimeter wide and vertical 1 centimeter wide?
  - How to make text fully justified?
  - How to make space between lines 1.2 of font size?
 - How to make headings be numbered like that: 1. … 1.1. … 1.2. … 2. … 3.2. …
  - How to make heading be numbered like that: 1. … 1.a … 1.b … 2. … 3.b …
  - How to make an element (text/picture/figure, etc.) aligned to the center? to the bottom? to the center and the bottom simultaneously?
  - How to change PDF metadata.
+ How to change all occurrences of ABC in the document into DEF?
+ How to add 15 words of Lorem ipsum into the document?
+ How to prevent undesired line breaks, e.g., before and after an image?