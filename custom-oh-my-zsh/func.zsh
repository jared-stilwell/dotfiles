function cocktail { export PS1="~ 🍸  "; }
function burger   { export PS1="~ 🍔  "; }
function coffee   { export PS1="~ ☕  "; }
function beerme   { export PS1="~ 🍺  "; }
function bomb     { export PS1="~ 💣  "; }
function sportsball { export PS1="~ 🏈  "; }
function dice     { export PS1="~ 🎲  "; }
function monster  { export PS1="~ 👾  "; }

# Node
function nodedebug() {
	supervisor -i . -x node-inspector .
}

function nodeunitdebug() {
	supervisor --debug-brk -- `which nodeunit` $1 & 2>$1 > /dev/null
}

