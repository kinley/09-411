gem 'TuringMachineRuby'
require 'turing_machine_ruby'

tape = ')(()(()'
file_path = 'turing_machine.txt'

# True output: ")(..(..", because мы удаляем соседние, т.е "()"
p TuringMachineRuby::Main.new(tape, file_path, 0, '.').run_until_exit_state.join('')

# Почти реализовал, как в примере к 5
# Но, блин, до конца все равно не возможно это довести, учитывая,
# что не знаешь длину ленты,
# да и она бесконечная, так что заюзал программный хук.
p TuringMachineRuby::Main.new(tape, 'turing_machine_imba.txt' , 0, '.').
      run_until_exit_state.join('').gsub('*', '(')
