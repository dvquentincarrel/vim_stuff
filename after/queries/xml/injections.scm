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
; BEWARE! The CDATA highlight in the default query has a priority. It must be
; removed for this to work (seemingly can't put priorities on injections)
(element
  (STag  
    ((Name) @_e_name (#eq? @_e_name "field"))
    (Attribute
      ((Name) @_a_name (#eq? @_a_name "name"))
      ((AttValue) @_a_val (#any-of? @_a_val "\"code\"" "\"raw_code\""))))
  (content 
    (CDSect 
      (CDStart)
      ((CData) @injection.content
               (#set! injection.language "python")))))
; vim: ft=query
