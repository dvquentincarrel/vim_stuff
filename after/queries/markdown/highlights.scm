; inherits markdown

; ## ...
(atx_heading
  (atx_h2_marker)
  ((inline) @include)
) @include
 
; ### ...
(atx_heading
  (atx_h3_marker)
  ((inline) @field)
) @field
 
; #### ...
(atx_heading
  ((atx_h4_marker))
  ((inline) @constant)
) @constant
 
; ##### ...
(atx_heading
  (atx_h5_marker)
  ((inline) @constant.builtin)
) @constant.builtin
 
; ###### ...
(atx_heading
  (atx_h6_marker)
  ((inline) @conditional)
) @conditional

; # 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
; ## 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
; ### 3 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
; #### 4 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
; ##### 5 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
; ###### 6 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
