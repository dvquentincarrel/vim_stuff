; inherits xml

; <button name="xxxx" .../> | <label name="xxxx" .../>
(((Name) @_tag
         (#any-of? @_tag "button" "label"))
 (Attribute
   ((Name) @_attr
           (#eq? @_attr "name"))
   ((AttValue) @markup.strong @constant)))

; <field name="xxxx" ... type="xxx"/> | <field name="xxxx" ... type="xxx"> ... </field>
(((Name) @_tag
         (#eq? @_tag "field"))
 (Attribute  
   ((Name) @_attr
           (#eq? @_attr "name"))
   ((AttValue) @markup.strong @constant))
 (Attribute
   ((Name) @_attr2
           (#eq? @_attr2 "type"))))

; <xxx onchange="xxxx"/>
(Attribute  
  ((Name) @_attr
          (#eq? @_attr "onchange"))
  ((AttValue) @markup.strong @keyword.operator))
