" Store your macro in register q
" This macro replaces inner " with \" in a JSON line that is string: string
" Example: "the_key": "the value with inner " inside",
" Into:  "the_key": "the value with inner \" inside",
let @n = 'wwwwlv$F"€ý5h:s/\%V"/\\"/gj0'

" Similarly, this macro removes all of the text inside the value string in a
" string: string json line.
" Example:  "the_key": "the value",
" Into: "the_key": "",
let @m = 'wwwwlv$F"€ý5hxj0'

" Create a command to run them
command! EscapeInnerQuotes normal! @n
command! RemoveValueString normal! @m



