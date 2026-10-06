#set page(paper: "a5")
#title("1. Writing in Typst")
= Basic markups
- `_text_` $arrow$ _text_
- `*text*` $arrow$ *text*
~
- `= Text` $arrow$ heading of 1st lvl.
- `== Text` $arrow$ heading of 2nd lvl.
  - etc.
~
- `+` $arrow$ numbered list's item.
- `-` $arrow$ bulleted list's item.
- Use tabbing to create sublists.

= Adding pictures
`#image("picture.jpg")`-- pastes the picture. Typst understands only relative paths.

`#image("picture.jpg", width: 50%)` -- twice less wide as the text.

`width: 1cm` -- 1cm wide.

~

To create a figure with a caption, use:
```typst
#figure(
  image(...),
  caption: [
  ...
  ],
)
```

~

`<example>` -- creates a label.

`@example` -- creates a reference.

= Bibliography
`#bibliography("file.yml")` -- uploads a bibliography. #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[*Click here*] to know more about the `.yml` format.

`@<key>` -- makes a reference to a bibliography entry.

= Math
`$text$` -- in-line math.

`$ text $` -- displayed math.

`$..."text"...$` -- plain text inside math mode.

~

Functions don't require `#` in math mode.

`(...)` -- either creates parentheses or makes a group.

~

`$beta$` #sym.arrow $beta$; #h(12pt) `$Beta$` #sym.arrow $Beta$; #h(12pt) `$epsilon$` #sym.arrow $epsilon$; #h(12pt) `$Epsilon$` #sym.arrow $Epsilon$; #h(12pt) `$nabla$` #sym.arrow $nabla$.

`$x_a^b$` #sym.arrow $x_a^b$; #h(12pt) `$x_(a b)^(c d)$` #sym.arrow $x_(a b)^(c d)$.

`$sum$` #sym.arrow $sum$; #h(12pt) `$integral$` #sym.arrow $integral$.

`$a arrow.squiggly b$` #sym.arrow $a arrow.squiggly b$.

`$a/b$` #sym.arrow $a/b$; #h(12pt) `$(a+b)/(c+d)$` #sym.arrow $(a+b)/(c+d)$; #h(12pt) `$(x(x+1))/(x+1)$` #sym.arrow $(x(x+1))/(x+1)$.

`$cal(N)$` #sym.arrow $cal(N)$; #h(12pt) `$vec(x_1, x_2, x_3)$` #sym.arrow $vec(x_1, x_2, x_3)$.

To put a math symbol inside text mode, use `#sym.<symbol>`. To look at available symbols, #link("https://typst.app/docs/reference/symbols/sym/")[*click here*]. To find a symbol by its appearance, use #link("https://detypify.quarticcat.com/")[*Detypify*].

= Questions
+ Explain functionality and syntax of `#bibliography` function.
+ How to make an _italicized text_? a *bold text*?
+ What're the outputs of the following codes: `$Beta$`, `$integral$`, `$x^b_a$`, `$arrow.squiggly$`, `$(x(x+1))/(x+1)$`, `$cal(N)$`, `$vec(x_1, x_2, x_3)$`?
+ What is the function of `=` markup? Of `==` markup? Of `===`, etc.?
+ How to make a numbered list? A bulleted list? A sublist?
+ What're the syntax and function of the `#image` command?
+ Explain the following constructions: `$...$`, `$ ... $`, `$..."text"...$`
+ How to add a caption to the picture?
+ How to make a heading of 1st level, 2nd level, 3rd level, etc.?
+ What's the purpose of `#sym.<...>` construction?
+ How to make a label? How to refer to it?
+ What're the 2 different roles parentheses can play in the math mode?
+ What're the functions of `*...*` and `_..._` markups?
+ How to change a width of the picture? How to make it 25% of the text width?
+ How to make a bibliography? Which file extension does it have? How to upload a bibliography to the main file? How to refer to a bibliography's item?
+ How to paste an image into the main file? How to control the picture width?
+ What's the point of `@<...>` and `<...>`?
+ How to put a math symbol into text mode?
+ How to make an inline math? Displayed math? A plain text in the math mode?
+ Which delimiters we use to group objects in math mode?
+ What's the point of `+` and `-` markups? Why do sometimes they require tabbing indentation?
+ What do functions lack in math mode? Give an example of a math-mode function.
+ What's a `.yml` file?
+ Give code to product these outputs: $beta$, $x_(a b)^(c d)$, $sum$, $arrow$, $(a+b)/(c+d)$.
+ What're the syntax and functionality of `#figure` function?
+ How to find a code for a math symbol (2 ways)?