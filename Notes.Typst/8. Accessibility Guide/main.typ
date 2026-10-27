#import "template.typ": template
#let my-line = box[#line(length: 100%)]
#let my-skew(ax: 0deg, ay: 0deg, content) = box(skew(ax: ax, ay: ay, reflow: true)[#content])

#show: template.with(my-title: [8. Accessibility Guide])

= Basics
- Don't communicate any information thru visual means only.
- Use elements that carry semantics.
- Remember, that moved elements are read where they are in code.
- Hide decorations from TTS.
- Make document adjustable.

= `#quote(..)[..]`
One of the semantically loaded elements. When encountered by TTS, it would be announced as "quote".

#quote[`#quote[..]` -- creates an inline quote enclosed in quotation marks.]

#quote(block: true)[`#quote(block: true)[..]` -- creates a displayed quote with adjusted margins.]

= `tracking` argument
Adjust the space between characters. Can carry meaning (e.g., emphasis) for a sighted person, but for TTS assistant won't get it.

`#text(tracking: 0.2em)[SPACED OUT]` #sym.arrow #text(tracking: 0.2em)[SPACED OUT]
`#text(tracking: -0.1em)[squeezed together]` #sym.arrow #text(tracking: -0.1em)[squeezed together]

= Non-breaking space and tilde. 
You can (but shouldn't) adjust the space using `~` for non-breaking space. For verbatim \~ use `\~` escaping. IDE can mark this with red color, but it's OK. 

= Pseudo-move functions
These functions change the dimensions of the wrapped content, but don't affect layout and don't carry semantics. To make them affect the layout, use `reflow:` `true` argument. 

They also place the content in its own block, breaking lines. Use `#box[..]` to avoid this.

== `#move(..)[..]`
`#move(dx: len, dy: len)[..]` -- #box(move(dx: 3pt, dy: 4pt)[shifts]) #box(move(dx: 5pt, dy: -3pt)[the]) #box(move(dx: 4pt, dy: 7pt)[content.]) The length can be negative.

== `#scale(..)[..]`
`#scale(num%)[..]` -- changes #box(scale(150%, reflow: true)[size]) of the #box(scale(75%, reflow: true)[content]).

== `#skew(..)[..]`
`#skew(ax: angle, ay: angle)[..]` -- #my-skew(ax: 30deg)[leans] #my-skew(ax: -30deg)[the] #my-skew(ay: 10deg)[content.] The angle can be negative #my-skew(ay: -12deg)[(e.g., `-12deg`).]

= `#stack(..)`
`#stack(dir: .., spacing: len, [..], [..], [..])` puts items one after another in a direction. `dir` argument can take:
#stack(
dir: ltr,
spacing: 1em,
[`ttb` -- top to bottom],
[`btt` -- bottom to top],
[`ltr` -- left to right],
[`rtl` -- right to left],
)

= `#math.equation(..)`
Is a full form of `$..$` markup. It takes an equation enclosed in `$`-signs as a positional argument and named argument `block:` that makes it displayed when `true`.
#align(center)[#box[```typst
#math.equation(
  block: true,
  $2+2=4$
)
```] \ #sym.arrow.b \
#box(math.equation(
  block: true,
  $2+2=4$
))]

= Artifacts
Some things aren't intended to be read by TTS (hyphens, headers, page numbers). Such things are called artifacts. Most of them Typst marks automatically. To mark your custom artifact, wrap it into `#pdf.artifact[..]`

= `alt: ".."` argument
TTS cannot describe on their own what we see in `#image()`, `#figure()` or `#math.equation()`. That's why these functions take `alt: "str"` argument that will be read by TTS.

= `lang: ".."` and `region: ".."`
They are arguments of `#text()` and can be used `#text(lang: "ru")[`вызовом функции`]` or thru `#set text(..)`. They help TTS read document properly and set names of things, applied typography and spelling check. The `region:` argument specifies a dialect if needed.

There are several special codes for languages:
#stack(dir: ltr, spacing: 1fr,
  [`"zxx"` -- not \ natural],
[`"und"` -- natural,\ but unknown], [`"mis"` -- known, \ but with no code]
)

= Questions
+ Give examples of situations when information is communicated thru visual means only. Why it's bad for accessibility?
+ Give examples of situations, when the document retains the same appearance, but semantic load is lost. Why it's bad for accessibility?
+ How does TTS read elements, whose seen position differs from source-code position?
+ Which element we should hide from TTS "eyes"?
+ Why HTML is better than PDF in terms of adjustability?
+ Explain `#quote()` function.
+ Explain `tracking:` argument.
+ What is `~` used for? How to escape the symbol?
+ What are pseudo-move functions? How to make them affect layout? How to make them not break lines?
+ Explain `#move()` function.
+ Explain `#scale()` function.
+ Explain `#skew()` function.
+ Explain `#stack()` function.
+ Explain `#math.equation()` function.
+ What are artifacts? Explain `#pdf.artifact()` function.
+ Explain `alt:` argument.
+ Explain `lang:` and `region:` arguments.
+ Explain `zxx`, `und` and `mis` language codes.