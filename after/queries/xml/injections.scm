; inherits xml
; <field name="raw_code|code"> ... </field>
(element
  (STag  
    ((Name) @_e_name (#eq? @_e_name "field"))
    (Attribute
      ((Name) @_a_name (#eq? @_a_name "name"))
      ((AttValue) @_a_val (#any-of? @_a_val "\"code\"" "\"raw_code\""))))
  (content 
    ((CharData) @injection.content
                (#set! injection.language "python"))))

; <field name="raw_code|code"><![CDATA[ ... ]]></field>
(element
  (STag  
    ((Name) @_e_name (#eq? @_e_name "field"))
    (Attribute
      ((Name) @_a_name (#eq? @_a_name "name"))
      ((AttValue) @_a_val (#any-of? @_a_val "\"code\"" "\"raw_code\""))))
  (content 
    (CDSect 
      ((CData) @injection.content
               (#set! injection.language "python"))))
  (#set! "priority" 110))
; vim: ft=query
