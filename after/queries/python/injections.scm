; inherits python

; cr.execute(""" ... """)
(call
  function: ((attribute) @f_name (#match? @f_name "cr.execute"))
  arguments: (argument_list
               (string 
                 (string_start)
                 ((string_content) @injection.content
                                   (#set! injection.language "sql")))))

; cr.execute(""" ... """ % (...))
(call
  function: ((attribute) @f_name (#match? @f_name "cr.execute"))
  arguments: (argument_list
               (binary_operator
                 (string 
                   (string_start)
                   ((string_content) @injection.content
                                     (#set! injection.language "sql"))))))

(call
  function: ((attribute) @f_name (#match? @f_name "cr.execute"))
  arguments: (argument_list
               (call (attribute (string 
                                  (string_start)
                                  ((string_content) @injection.content
                                                    (#set! injection.language "sql")))))))
; vim: ft=query
