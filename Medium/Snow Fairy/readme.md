## Medium

<p align="center"><img src="header.png" width="" height=""/></p>

> Hint : Stegosaurous and snow fairy are a good team at hiding

### Solution

We are given `flag.txt` which suprisingly is too big for a few words of text \
Opening with hex editor reveals random dots and spaces which are not shown by notepad \
The challenge title and hints suggest towards a tool called **stegsnow**

Running stegnow reveals our hidden flag
```sh
stegsnow -C flag.txt
```

flag : **cryptX\{t3Xt_iN5iDE_7EXT}**