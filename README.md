# Hotkeys

* `F2`: Toggle the Line Numbers.
* `F7`: Toggle NERDTree.
* `F8`: Toggle Tagbar.


* `i`: Enter in the _Insert Mode_.


* `za`: Toggle (open/close) the folding in the cursor by 1 level.
* `zA`: Toggle (open/close) the all levels from the folding in the cursor.
* `zR`: Open all Foldings.
* `zM`: Close all Foldings.


* `/`: Search. Select a text area to only search in that region.


* `\fx`: Format a selected region of XML text.
* `\fj`: Format a selected region of JSON text.


## Operators

* `v`: Enter in the _Visual Mode_. Selects the current character.
* `V`: Enter in the _Visual Mode_. Selects the current line.
* `CTRL + v`: Enter in the _Visual Mode_. Box/Region selection.


* `~`: Toggle between lower and uppercase.


## Operator Objects

* `^`: Beginning of the line.
* `$`: End of the line.

# Functions


## In Normal Mode

### `:Rename <new-file-name>`

Use it to instantly rename the file you're current working on.

### `:Space2Tab`

Change the identation from your file from _spaces_ to _tabs_.

### `:SyntasticToggleMode` and `:SyntasticCheck`

We use _syntastic_ as a linter helper.
It's deactivated by default, starting in the _passive mode_ which it doesn't check your code in real time.

Use `:SyntasticToggleMode` to start the _active mode_, where every time you save your file, your code will be checked.
You can also use `:SyntasticCheck` to instantly check your file once. It works in both _active_ and _passive_ modes.

### `:Tab2Space`

Change the identation from your file from _spaces_ to _tabs_.


## On Visual Selection

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
