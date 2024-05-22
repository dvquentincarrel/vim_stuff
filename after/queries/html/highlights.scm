; inherits html

; <button name="xxxx" .../> | <label name="xxxx" .../>
(((tag_name) @_tag
             (#any-of? @_tag "button" "label"))
 (attribute  
   ((attribute_name) @_attr
                     (#eq? @_attr "name"))
   (quoted_attribute_value (attribute_value) @markup.strong @constant)))

; <field name="xxxx" ... type="xxx"/> | <field name="xxxx" ... type="xxx"> ... </field>
(((tag_name) @_tag
             (#eq? @_tag "field"))
 (attribute  
   ((attribute_name) @_attr
                     (#eq? @_attr "name"))
   (quoted_attribute_value (attribute_value) @markup.strong @constant))
 (attribute
   ((attribute_name) @_attr2
                     (#eq? @_attr2 "type"))))

; <xxx onchange="xxxx"/>
(attribute  
  ((attribute_name) @_attr
                    (#eq? @_attr "onchange"))
  (quoted_attribute_value (attribute_value) @markup.strong @keyword.operator))
