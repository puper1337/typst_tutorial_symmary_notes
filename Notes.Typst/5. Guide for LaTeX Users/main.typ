#import "template.typ": template
#show: template.with(my-title: [5. Guide for LaTeX Users])

= Markups #sym.arrow Functions
#box[
  - `=` #sym.arrow `#heading`
  - `* *` #sym.arrow `#strong`
  - `_ _` #sym.arrow `#emph`
  - `< >` #sym.arrow `#label`
  - `@` #sym.arrow `#ref` or `#cite`
]
#h(5em)
#box[
  - \` \` #sym.arrow `#raw`
  - `-` #sym.arrow `#list`
  - `+` #sym.arrow `#enum`
  - `/ <term>:` #sym.arrow `#terms`
  - `$ $` #sym.arrow `#equation`
]

In Typst, function call always follows with parentheses.

= Lists
`/ <term>: <description>` -- creates an item of
/ Description: list.

`#enum(numbering: <string>)` -- changes the numbering style.

_blank line between items_ -- makes spacing of a list wider.

= Text formatting
Web-links can be put as they are: https://example.com/.

`#underline[<text>]` -- #underline[makes the text underlined].

`#lower("TEXT")` -- returns lower-case text.

To produce monospaced text, choose a monospaced font or use `$mono(<text>)$`.

To choose a language, use `#text(lang: <string>)`

`#rgb("<code>")` -- returns a color, can be used in arguments such as `fill: ...`

`#rect(stroke: red)[Text]` #sym.arrow #box[#rect(stroke: red)[Text]]

`#par(first-line-indent: <length>)` -- sets indentation.

`#par(spacing: <length>)` -- sets a gap between paragraphs.

`#pad(<arg: value list>)[...]` -- takes the same arguments as `margin: (...)` property. Shrinks space if the length's positive and expands if negative. E.g., `#pad(x: -1cm)[<paragraph>]` expands margins in 2cm. The `rest: <length> ` argument sets all unsettled sides.

*How set rule works.*  Set rule affects elements if the elements don't have default settings of the property. E.g.:
- `math.equation` doesn't have its default color #sym.arrow` #set text(fill: red)` will affect `$<equation>$`.
- `math.equation` has its default weight of 450 #sym.arrow `#show math.equation` is required.

= Math
`$cases(a, b, c)$` $->$ $cases(a, b, c)$.

`$mat(a, b, c; e,f,g)$` $->$ $mat(a, b, c; e,f,g)$.

`$dots.v$` $->$ $dots.v$ #h(2em) `$dots.down$` $->$ $dots.down$

`$arrow.l.squiggly$` == $arrow.l.squiggly$

To use Typst values in math mode, use `#`, e.g.,
`$text(fill: #red, x_2)$` $-> text(fill: #red, x_2)$.

`#set math.frac(style: <str>)` property can be:
#set math.frac(style: "vertical")
- "vertical" $-> (a+b) / (a-b)$

#set math.frac(style: "skewed")
- "skewed" $-> (a+b) / (a-b)$

#set math.frac(style: "horizontal")
- "horizontal" $-> (a+b) / (a-b)$
#set math.frac(style: "vertical")
*Escaping* is a use of special character to treat the next one differently. In math mode we escape slashes and delimiters using `\`, e.g:
- `$(a+b)\/(a-b)$` $-> (a+b)\/(a-b)$ in the vertical style.
- `$ \( (a+b)/c ) $` #box[$ -> \( (a+b)/c ) $].

`$lr(size: #<n>%, <del><expr><del>)$` controlles the size of delimiters and allows the use of not-parred ones, e.g.:
$ #`$lr(size: #500%, |(x-2)/(x+2)|)$` -> lr(size: #200%, |(x-2)/(x+2)|) $.

= `if` and `for` 
`#for x in (1, 2, 3) [#x]` $->$ 123.

`#if 0 == 0 [Hello] else [Goodbye]` $->$ Hello.

`#range(4)` $->$ (0, 1, 2, 3) #h(2em) `#range(2, 5)` $->$ (2, 3, 4)

= import and include

`#import <str>: <name list>` -- import names, use `*` instead of the list to import all the names. To import from #link("https://typst.app/universe/")[*Typst Universe*], use a string of the following form: `"@preview/<name>:<version>"`, e.g., 
`#import "@preview/cetz:0.5.2": *` -- very powerful drawing tool.

The name conflict solves very simply: the last declaration of the name in current scope is used.

`#include "<file>"` -- includes content, not names (variables/functions).

`#cite(<key>, form: "prose")` -- produces a citation that is suitable for inclusion in a sentence.

= Questions 1
+ Give corresponding functions for the following markups: `=`, `* *`, `_ _`, `< >`, `@`, \` \`, `-`, `+`, `/ <term>:`, `$ $`.
+ What does #text(fill: blue)[`/ <term>: <description>`] markup creates?
+ Explain `enum.numbering` property.
+ What does blank line between list item do to the list?
+ Explain `#underline()` and `#lower()` functions.
+ How to produce monospace text in: content mode, math mode?
+ How to say Typst which language a text is written in?
+ Explain `#rgb()` function.
+ Explain `rect.stroke` property.
+ Explain `par.first-line-indent` property.
+ Explain `par.spacing` property.
+ Explain `#pad()` function.
+ Explain `page.margin.rest` property.
+ Why `#set text(fill: red)` affects math-mode text, but `#set text(weight: "regular")` doesn't? Explain in terms of how set rule works.
+ Explain `cases()` function. Explain `mat()` function.
+ What will be produced by `$dots.v$, $dots.down$, $arrow.l.squiggly$`?
+ Find an error: `$text(fill: red,
x_2)`.
+ Explain `math.frac.style` property.
+ What is escaping in the context of programming?
+ How to escape slashes and delimiters in math mode?
+ Explain `lr()` function.
+ Explain `#for` command.
+ Explain `#if` command.
+ Explain `#range()` function.
+ Explain `#import` command.
+ What's `*` used for in `#import` command and where?
+ How does a string we use with `#import` to import something from Typst Universe look?
+ What's CeTZ package is used for?
+ Explain `#include` command.
+ Explain `#cite()` function.
 
= Questions 2
+ Give markups for the following functions: `#heading(), #strong(), #emph(), #label(), #ref(). #cite(), #raw(), #list(), #enum(), #terms(), #equation()`.
+ Which markup created an item of description list?
+ How to make numbered list to be numbered like I, II, III, ...
+ Is `#link()` necessary to put a web-link?
+ How to make text #underline("underlined")? Which function wraps a string and returns the string with all lowercase?
+ Explain `mono()` function.
+ Explain `text.lang` property.
+ How to produce a color value knowing the RGB code of the color.
+ How to produce #h(0.5em) #box[#rect(stroke: blue)[Text]]#h(0.5em)?
+ How to make first lines of paragraphs indented?
+ How to set gap between paragraphs?
+ How to make margins of a particular paragraph shrink or expand?
+ What's a selector for math-mode text?
+ What's default weight of math-mode text?
+ How to produce $cases(a, b,c)$ ? #h(2em) How to produce $mat(a, b, c; d, e, f)$?
+ How to produce the symbols: What will be produced by $dots.v$, $dots.down$, $arrow.l.squiggly$?
+ What's required to use Typst data types such as length, color, alignment, etc., in the math mode?
+ How and what for we use the strings "vertical", "skewed", "horizontal". Hint: it's about math mode.
+ How do we call a use of special character to treat the next one differently?
+ What will be rendered from `$(a+b)\/(a-b)$` and `$ \( (a+b)/c ) $`?
+ How to use not-pared characters such as |...| as scalable delimiters? How to control the scaling?
+ Predict the output: `#for x in (1, 2, 3) [#x]`.
+ Predict the output: `#if 0 == 0 [Hello] else [Goodbye]`.
+ Which function produces array from 0 to `<arg minus 1>`. What does it do when given two arguments?
+ Which command do we use to import names (func/var)?
+ How to import all the manes from the file at once?
+ Explain the string by its parts: `"@preview/cetz:0.5.2"`. Where and what for is it used?
+ How does Typst resolves name conflicts?
+ Which command do we use to import content from another file? Does it imports the names of functions and variables determined in the file?
+ Explain `cite.form` property.