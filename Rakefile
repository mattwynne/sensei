# Your project should respond to 'rake spec' and 'cucumber features'.

task :dojo do
  run_dojo(RealGit.new)
end

task :fake_dojo do
  run_dojo(FakeGit.new)
end


class RealGit
  def do command
    system("git #{command}")
  end
end

class FakeGit
  def do command
  end
end


def get_name
  print "Enter your name: "
  STDIN.gets
end

def run_dojo(git)
  Dojo.new(get_name, git).run
end


class Dojo
  
  def initialize(name, git)
    @git = git
    @name = name
    @iteration = 1
    @git.do("checkout iteration-1")
    @git.do("branch -D #{name}")
    @git.do("checkout -b #{name}")
  end 
  
  def suggest_write_specs
    puts
    puts "FAIL: how about writing some specs in ./spec ?"
    puts "FAIL! Hit [ENTER] to run them when you're ready..."
    STDIN.gets
  end
  
  def cukes_failed
    puts 
    puts "FAIL: Your cukes failed!"
  end
  
  def specs_failed
    puts
    puts "FAIL: Better fix those specs!"
    puts "FAIL! Hit [ENTER] to run them when you're ready..."
    STDIN.gets
  end
  
  def specs_passed
    puts
    puts "Your specs passed :-). Hit [ENTER] to try the cukes again"
    STDIN.gets
  end
  
  def run
    until @iteration > 5

      run_cukes
      unless @cukes_passed 
        cukes_failed
        suggest_write_specs
        run_specs
        until @specs_passed
          specs_failed
          run_specs
        end
        specs_passed
        run_cukes
      end

      if success?
        if @iteration < 5
          commit("iteration #{@iteration} tests passing.")

          puts
          puts
          puts "WIN!"
          puts "Perhaps you would care for a spot of refactoring at this point?"

          refactoring_loop
          next_iteration
        else
          puts "EPIC WIN! Now to play the refactoring game..."
          until false
            system("rake spec features")
            if success?
              flog
              commit "refactoring"
            end
            puts "Not bad. Can you do any better? (Hit a key to re-run the flog)"
            STDIN.gets
          end
        end
      end
    end
  end 
  
  def success?
    $?.exitstatus == 0
  end
  
  def run_cukes
    system("cucumber features")
    @cukes_passed = success?
  end

  def run_specs
    system("rake spec")
    @specs_passed = success?
  end

  def next_iteration
    commit("iteration #{@iteration} refactored.")
    @iteration = @iteration+1
    @git.do("merge iteration-#{@iteration}")
  end

  def commit message
    @git.do("add .")
    @git.do(%Q{commit -m "#{message}"})
  end
  
  def flog
    system("flog lib/*.rb")
  end

  def refactoring_loop
    go_next = false
    until go_next
      message = "Press [ENTER] to run the tests again (with refactoring tips)"
      message << ", [SPACE ENTER] to move to the next iteration" if success?
      puts message

      go_next = (STDIN.gets == " \n")
      
      unless go_next && success?
        system("rake spec features")
        if success?
          flog
        end
        go_next = false
      end
    end
  end
end