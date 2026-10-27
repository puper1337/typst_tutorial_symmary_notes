#let template(my-title: [], doc) = {
  set document(title: my-title)
  set page(
    paper: "a5",
    numbering: "1"
  )

  title()
  outline()
  doc
}