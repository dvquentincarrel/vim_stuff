; inherits markdown

; ## ...
(atx_heading
  (atx_h2_marker)
  ((inline) @include)) @include

; ### ...
(atx_heading
  (atx_h3_marker)
  ((inline) @field)) @field

; #### ...
(atx_heading
  ((atx_h4_marker))
  ((inline) @constant)) @constant

; ##### ...
(atx_heading
  (atx_h5_marker)
  ((inline) @constant.builtin)) @constant.builtin

; ###### ...
(atx_heading
  (atx_h6_marker)
  ((inline) @conditional)) @conditional
