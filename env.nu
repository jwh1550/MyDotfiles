# Nushell Environment Config File




#def create_left_prompt2 [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }

#    $path_segment
#}


def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

def create_right_prompt [] { 
    starship prompt --right
    }

#def create_right_prompt [] {
#    let time_segment = ([
#        (date now | date format '%m/%d/%Y %r')
#    ] | str join)
#
#    $time_segment
#}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
#let-env PROMPT_COMMAND_LEFT = { create_left_prompt2 }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }


# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }


# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

#mkdir ~/.cache/starship; starship init nu | save ~/.cache/starship/init.nu






let-env EDITOR = '/usr/bin/nano'
let-env PATH = ($env.PATH | prepend '/home/p/.cargo/bin')   

#let-env PATH = ($env.PATH | prepend "/home/p.cargo/bin/fnm")
#load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column = | rename name value | where name != #"FNM_ARCH" && name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })



#let-env PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")

let-env STARSHIP_SHELL = "nu"
/usr/local/bin/starship


# FNM
# load env variables


# add dynamic fnm path
let-env PATH = ($env.PATH | split row (char esep) | prepend ([$env.FNM_MULTISHELL_PATH "bin"] | path join))

# add fnm with cd

alias cd = fnmcd


def-env fnmcd [path: string] {
  let-env PWD = ($path | path expand)
  if (['.node-version' '.nvmrc'] | any ($env.PWD | path join $it | path exists)) {
     fnm use --silent-if-unchanged
  }
}






###
#### Use nushell functions to define your right and left prompt
###let-env PROMPT_COMMAND = { create_left_prompt }
###let-env PROMPT_COMMAND_RIGHT = ""
###
#### The prompt indicators are environmental variables that represent
#### the state of the prompt
###let-env PROMPT_INDICATOR = ""
###let-env PROMPT_INDICATOR_VI_INSERT = ": "
###let-env PROMPT_INDICATOR_VI_NORMAL = "〉"
###let-env PROMPT_MULTILINE_INDICATOR = "::: "
