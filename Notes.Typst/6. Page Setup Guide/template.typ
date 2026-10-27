#let template(my-title: [], doc) = {
  show "н": it => "〈"
  show "к": it => "〉"
  set document(title: my-title)
  set page(
    paper: "a5",
    numbering: "1"
  )

  title()
  outline()
  doc
}