# Sensei

Sensei runs your dojo for you. You start with a single failing cucumber feature. As you make each feature pass, the next feature is brought into play. While you have failing features, you have the opportunity to write rspec specifications. Sensei will encourage you to refactor at appropriate moments, showing you your [flog](http://blog.zenspider.com/rubysadism/flog/) score as encouragement.

This should replicate an outside-in development style, where the cucumber features represent acceptance/integration tests and the specs are lower level unit tests that help you develop the individual methods and classes.

# Running a dojo

    git clone git://github.com/alexscordellis/sensei.git
    git clone git://github.com/alexscordellis/kata-minesweeper.git (or other dojo repository)
    cd kata-minesweeper
    rake -f ../sensei/Rakefile dojo

Then follow the instructions. Each time you get to green, sensei will make a commit to git. This way you'll have a history of all your implementation and refactorings. You could then push those changes to a github fork of the dojo repository and compare your solution to others'.

# Prepared dojos

## Minesweeper

Source is [on github](http://github.com/alexscordellis/kata-minesweeper "Minesweeper source"). This is a simple implementations of the classic Windows minesweeper game. The features currently available specify how the completed board should appear given the size and the mine locations. This is the original dojo from Matt's session.

# Prerequisites

You will need the following gems

* rake
* rspec
* cucumber
* flog

# Preparing your own dojo

Your project must respond to the commands `rake spec` and `cucumber features`, issued from the command line in the root directory. Only code matching `./lib/*.rb` will be included in the flog score.

# Credits

The original idea came from [Matt Wynne](http://blog.mattwynne.net/)'s session at the [September 2009 London Ruby Users Group](http://lrug.org/meetings/2009/09/18/october-2009-meeting/). I've added the rspec part of the workflow and I'm working on the packaging. The features for the minesweeper kata are his.