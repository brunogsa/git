# General Features

* `F2`: Toggle the Line Numbers.
* `F7`: Toggle NERDTree.
* `F8`: Toggle Tagbar.


* `i`: Enter in the _Insert Mode_.

* `~`: Toggle between lower and uppercase.


## Auto-Complete

* `TAB`: Complete a text for you.


## Folding

* `za`: Toggle (open/close) the folding in the cursor by 1 level.
* `zA`: Toggle (open/close) the all levels from the folding in the cursor.
* `zR`: Open all Foldings.
* `zM`: Close all Foldings.


## Searching

* `/`: Search. Select a text area to only search in that region.
* `?`: Search in reverse direction. Not work with visual selection.
* `*`: Search the word under the cursor. Also works with visual selection.
* `n`: Go to the next match.
* `N`: Go to the previous match.


## Formatting
* `\fx`: Format a selected region of XML text.
* `\fj`: Format a selected region of JSON text.


## Comments

* `''`: Comment / Uncomment lines.


## Code Layout

* `/ls`: Change the code Layout. Split function arguments or elements from arrays and objects into many lines.
* `/lj`: Change the code Layout. Join function arguments or elements from arrays and objects into one line.


* `cs<surrounding1><surrounding2>`: Changes the surrounding character 1, for the surrounding character 2.
* TBD: Easy way to add surroundings to the current word.


## Motion

* `gt<character>`: Go To character on the screen. Use it as an easy motion.
* `%`: If the cursor is under the start of a block - parenthesis, brackets, tags - it'll go to the end, and vice-versa.


## Swapping Texts

* On visual selection, `s` servers to swap.
* Delete a word. Select the word you want to swap. Press `s`.
* It also work with lines.


* For fast swaping on: Function Args, Array/Object elements
* Use `>` to move right.
* Use `<` to move left.


* `CTRL + j`: Move line down.
* `CTRL + k`: Move line up.


## Text Selection

* `v`: Enter in the _Visual Mode_. Selects the current character.
* `V`: Enter in the _Visual Mode_. Selects the current line.
* `CTRL + v`: Enter in the _Visual Mode_. Box/Region selection.


* `SPACE`: Keep pressing to expand the selected text.
* `BACKSPACE`: Come back to the previous selection.


## Highlights

* `\h`: Highlight the word under the cursor for you. Also works for visual selected texts.
* You can also use it double clicking with your _Mouse Left Button_.


## Bookmarks

* `m.`: Place the next bookmark available. If used again, it'll remove the bookmark.
* `']`: Jump to the next bookmark in alphabetical order.
* `'[`: Jump to the previous bookmark in alphabetical order.
* `m + SPACE`: Delete all bookmarks.


## Snippets

TBD

# Operator Objects

* `b`: Beginning of the line.
* `e`: End of the line.

# Functions


## In Normal Mode

### `:Rename <new-file-name>`

Use it to instantly rename the file you're current working on.

### `:Space2Tab`

Change the identation from your file from _spaces_ to _tabs_.

### `:SplitjoinSplit` and `:SplitjoinJoin`

Use `:SplitjoinSplit` to split function arguments or elements from arrays/objects into many lines.
Use `:SplitjoinJoin` to join function arguments or elements from arrays/objects into one line.

### `:SyntasticToggleMode` and `:SyntasticCheck`

We use _syntastic_ as a linter helper.
It's deactivated by default, starting in the _passive mode_ which it doesn't check your code in real time.

Use `:SyntasticToggleMode` to start the _active mode_, where every time you save your file, your code will be checked.
You can also use `:SyntasticCheck` to instantly check your file once. It works in both _active_ and _passive_ modes.

### `:Tab2Space`

Change the identation from your file from _spaces_ to _tabs_.


## In Visual Selection

### `:Linediff` and `:LinediffReset`

Use them to compare the 2 selected text areas.

### `:Narrow` and `:Widen`

After you selected some text, use `:Narrow` to move the selected text to an isolated context.
After you have finished your edition, use `:Widen` to bring those changes to the original file.

### `:Tabularize /<options>`

Align text for you.

You can align char `=`, for instance, using `:Tabularize /=`. <br>
You can align chars `=` and `;` using `:Tabularize /[=;]`

Check `:h Tabularize` for additional details.
