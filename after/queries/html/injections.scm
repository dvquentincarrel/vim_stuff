; inherits html
; <field name="raw_code|code"> ... </field>
(element
  (start_tag
   ((tag_name) @_tag (#eq? @_tag "field"))
   (attribute 
      ((attribute_name) @_attr @text.title (#eq? @_attr "name"))
      (quoted_attribute_value (attribute_value) @_a_val (#any-of? @_a_val "code" "raw_code"))))
  ((text) @injection.content
   (#set! injection.language "python"))
)
; vim: ft=query
