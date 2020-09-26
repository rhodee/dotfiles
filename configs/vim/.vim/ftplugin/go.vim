setlocal listchars=tab:\ \ ,trail:·,nbsp:·
setlocal noexpandtab

compiler go

let g:go_auto_type_info          = 1
let g:go_fmt_experimental        = 1
let g:go_statusline_duration     = 10000
let g:go_code_completion_enabled = 0
let g:go_auto_sameids            = 0
let g:go_def_mapping_enabled     = 0

let g:go_fold_enable                         = ['block', 'import', 'varconst', 'package_comment']
let g:go_fold_enable                         = ['import']
let g:go_fold_enable                         = []
let g:go_highlight_array_whitespace_error    = 0
let g:go_highlight_build_constraints         = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_diagnostic_errors         = 1
let g:go_highlight_diagnostic_warnings       = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 0
let g:go_highlight_format_strings            = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 0
let g:go_highlight_generate_tags             = 0
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 0
let g:go_highlight_operators                 = 0
let g:go_highlight_space_tab_error           = 0
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types                     = 1
let g:go_highlight_variable_assignments      = 1
let g:go_highlight_variable_declarations     = 1

