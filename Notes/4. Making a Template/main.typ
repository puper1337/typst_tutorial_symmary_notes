#import "template.typ": template
#show: template.with(my-title: [4. Making a Template])

= `#let`
`#let lol = [_kek_]` -- defines variable `#lol` that produces _kek_. A variable can contain: `"string", 666cm, 1488em, 69%, 420, false, center`, a function call or an expression, etc.

`#let my-func(a: 0, b: 0, divisor) = (a + b)/divisor` -- defines a function with _named arguments_ `a` and `b` that have default values 0, and a _positional argument_ `divisor`. `#my-func(b: 4, 2)` produces 2.

= Programming elements
- An _array_ is a structure like `(a, b, c,...)`.
  - Can be empty: `()`, or have 1 element `(a, )` -- a trailing comma is required.
  - Can be multiplied: #box[`(1fr,) * 3` = `(1fr, 1fr, 1fr)`].
  - Can be unpacked with `..<array>`, e.g., #box[`..([a], [b], [c])` = `[a], [b], [c]`].

- A _dictionary_ is a structure like (key-1: [field-1], key-2: "field-2", pidor: 1337,...). To read a field, use `#<dictionary>.<key>`.

- A _closure_, or _nameless function_, is a construction like `<input> => <output>`, e.g.: `x => x + 1` or `(a, b) => a + b`.

- A _method_ is a function of the `<object>.<method>()` form (don't confuse with a field access). Examples:
  - `<array>.len()` -- returns array's length.
  - `<array>.map(<function>)` -- returns a new array whose elements are the old elements processed by the function.
  - `calc.min(<list of numbers>)` -- returns the least number.
  - `<function>.with(<list of arguments>)` -- returns a new function with already filled arguments.

= Everything show rule
`#show: <function>` -- makes all that follows an argument of the function and returns the result. The function must be unary.

= Import from another file
`#import "<file>": <name list>` -- imports elements from the file. The imported element see not imported elements of the same file.

= Template recipe
+ Create a separate file.
+ Make a template function whose last argument will take the main document. Use `{}` if necessary.
+ Import the function to the main file.
+ To fill up secondary arguments and make the function unary, use everything show rule with either:
  - a nameless function: `doc => conf(<arg1>, <arg2>, doc)`,
  - `.with()` method: `conf.with(<arg1>, <arg2>)`.
+ Type your document below the rule.

= Some little life hacks 

#table(
  columns: 2,
  [`#table(...)` function is similar to `#grid(...)`],
  [`_#var_` won't work, use `_#var;_`],
  [`$->$` creates $->$, and there're other shortcuts:
`$-->$, $=>$, $<==>$`, etc.],
  [`row-gutter: <length>` parameter controls gaps between rows.]
)

= Questions
+ Explain `#let`.
+ How to define a function? A variable?
+ What's an array? A dictionary?
+ Give an empty array. Give a 1-element array.
+ What're dictionary keys? Dictionary field? What does `#dictionary.key` produce?
+ What's an array multiplied by a number? What's `..array`?
+ What's a closure? Give a closure of 1 argument. Of several arguments.
+ What's a nameless function? Give a nameless function of several arguments.
+ What's a method? 
+ Explain the following constructions: `.len(), .map(), .min(), .with()`.
+ Explain everything show rule? What kind of function does it require?
+ Explain `#import` function.
+ You imported function `#func` from `"template.typ"`. The file contains several functions and variables that are used in the body of `#func`, but haven't been imported. What will happen when you call `#func` in the main document? How to solve this problem?
+ Give a recipe of creating a table.
+ Explain how to provide a multi-argument function to everything show rule using: a) closure; b) `.with()`.
+ Explain `#table` function.
+ Why `_#var_` markupping won't work? How to resolve the issue?
+ Give shortcuts for: $->, -->, =>, <==>$. What do they require?
+ Explain `row-gutter: <...>` parameter.


