I've been through text editors before, but this one is different. I might put a ring on this one.

Vim is a text editor designed to reduce the amount of keystrokes in order to accomplish the same amount of work. The best part about vim is that your hands never have to leave the keyboard. In this post, I'll be talking about how I set up my vim to make my work highly efficient for me. We'll cover plugins, shortcuts, and other neat things.

If you're new to vim, the best way to get started is to go into vim and type `:help`. But if you're into more quizzical learning experiences, I recommend [shortcutfoo](https://www.shortcutfoo.com/app/tutorial/vim)

NOTE: I typically used Mac OS X's default Terminal for editing in vim, but in Mountain Lion, something has changed (for me at least) so that native vim in Terminal is slightly slower than a GUI, say [iTerm2](http://www.iterm2.com/) . I have since switched to that for vim, and all my command line work. I also recommend setting up [tmux](http://code.google.com/p/iterm2/wiki/TmuxIntegration) on iTerm2, but that's another topic.

Firstly, vim is great right out of the box.  All you need is a decent .vimrc to get you going, but if you want to manage large projects, most modern editors like textmate, sublime text, and xcode provide features that exemplify modern editing, including "open in project," "find in project," and others. Vim can do this as well with a few bundles.

The bundle manager I use is pathogen, although [vundle](http://lepture.com/work/vundle-vs-pathogen/) has been gaining steam recently.
<br />
<br />

**Plugins (must have)**

#    [Ack](https://github.com/mileszs/ack.vim):

![vim ack](http://i.imgur.com/nCxmo.png)
![vim ack2](http://i.imgur.com/gGiKt.png)

Vim ack is a "find in project" plugin. It will do searching for text in files on whatever your current working directory is. You can search by string, by regular expressions, or by file type. In the example, I can press `o` to open it in the current window, or `go` to just preview it and keep my cursor in the ack window, `t` to open in a new tab, or `v` for a new vertical window.

#    [Command-T](https://github.com/wincent/Command-T)

![vim command-t](http://i.imgur.com/eCAB8.png)

Command-T is the 'open in project' plugin.  It will do fuzzy searching for names of files on whatever your current working directory is. In this example, I type 'chispac' to locate the /path/to/Chipmunk/src/ccSpace.c and I type `Ctrl-j` to move down one file. I can press `<enter>` to open the file, or `Ctrl-v` to open it in a vertical window, or `Ctrl-t` to open in a new tab.

#    [BufExplorer](https://github.com/c9s/bufexplorer)

![vim bufexplorer](http://i.imgur.com/SnXn8.png)

If you're busy looking through files trying to find the right import or constant, it's easy to fill your buffer with junk, and it's a pain to type `:bp` or `:bn` several times to get to the file you want again. BufExplorer makes it easy on you when you've got a lot open all at one.  Just hit `<leader>b` and conveniently select which file in the buffer you'd like to go to.

#    NERDCommenter

Comment out code like a champ. Just hit `<leader>ci` to toggle comments on or off for a line.  `4<leader>ci` toggles comments for 4 lines.

#    [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658)

![nerdtree](http://i.imgur.com/Nhd1u.png)

Don't know where a file is? Or even what it's called? But you know it's somewhere in the Kobold2D directory?  NERDTree is your project browser. For me, it's `<leader>t` to open it.  Press `<enter>` on any folder to expand, and <enter> on any file to open it. `s` on any file to open a vertical split window. `t` on any file to open in a new tab. To close, just `<leader>t` again.

#    [Tagbar](http://majutsushi.github.com/tagbar/)

![vim tagbar](http://i.imgur.com/rnonn.png)

When you've got a large file and you want to quickly reference variables, methods, or classes, Tagbar is what you want. It provides a header definition view of your code.  Additionally, if you hit the `<enter>` key over a reference, you'll jump to that location in the code. For me, it's `<leader>l` to toggle.

**Plugins (extras)**


#    Supertab

Typing out long variable or method names is not what I want to be doing with my day. There're lots of ways around this, but I found supertab to be the nicest.  Just hit the <tab> key and watch it list all possible matches for you. It even lists matches in files open in other buffers. Thanks, autocomplete!

#    Snipmate

If you find yourself typing the same thing, for example: `import ipdb; ipdb.set_trace()`
If so, snipmate is good for you.  Instead of all that, I might set a snippet to be `ipdb<tab>` and it will type the rest out for me. Also works with multiliners like class definitions and java style code comments.

<br />
<br />
**Good Habits**

#    Tabs

![vim tabs](http://i.imgur.com/nhroH.png)

Instead of using buffers as tabs, you could use 'windows' as tabs instead.  Personally, I'm in favor of doing it this way.  I might have a tab dedicated to 3 or 4 python files and then another tab dedicated to a couple template files.  It's a way of visually seperating my code while I'm working.


    " ctrl-t makes a new tab
    noremap <C-t> <Esc>:tabnew<CR>

    " shift T turns a split window into it's own tab
    noremap <S-T> <Esc><C-w>T

    " ctrl h and l moves left and right between tabs
    noremap <C-h> <Esc>gT<CR>
    noremap <C-l> <Esc>gt<CR>


<br />
For me, it's `Ctrl-t` to open a new tab, or `Shift-T` to turn a split window into it's own tab.  `Ctrl-h` and `Ctrl-l` move left and right. `<leader>q` closes a tab.

#    Marks

![vim marks](http://i.imgur.com/17eNz.png)

Marks are a rarely spoken of gem in vim. Let's say I'm working on a massive 3000 line file called badfile.py. I could set a mark, `mA`, to note that I'm working on line 1234, and I want to go add an import to the top of the file, so I gg. Now how do I get back to line 1234 quickly? `'A`


    noremap <leader>m <Esc>:marks<CR>
    let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

<br />

I set `<leader>m` to show me where all my marks are set. Marks that are lower case [a-z] are local marks within the current file, while upper case marks [A-Z] are marks in any given file, even if it's not open.  So when I go to edit some other file and I want to quickly jump back to badfile.py, I just `'A` and I'm there on line 1234.

#    What was I doing?

If you look at the history in `:jumps`, you'll see a long list of things you've been doing. To easy jump back and forth in that history, just hit `Ctrl-i` to go back, and `Ctrl-o` to go forward.

<br />
<br />

**Other neat things**

#   Disable arrow keys so you learn, damn it

You should never have to touch the arrow keys.

    noremap <up> <nop>
    noremap <down> <nop>

<br />
Actually, you should never need to leave the home row.

#    Highlight bad whitespace

Whitespace is a horrible thing to the eyes, and if you're a python coder, it's a horrible thing to your job security.

    autocmd BufReadPost * match BadWhitespace /\s\+$/
    autocmd InsertEnter * match BadWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match BadWhitespace /\s\+$/
    highlight BadWhitespace ctermbg=1
    " Remove trailing whitespace on <leader>S
    nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

<br />
Do yourself a favor and make sure you can see bad whitespace so you can promptly eliminate it.

#    jj

`<esc>` is too far away to get out of insert mode, and `Ctrl-C` is too troublesome.

    inoremap jj <ESC>

<br />
Just hit `j` twice instead.

#    Specific filetype behavior

Python zen states 4 spaces as an indent, but if you have other preferences in your rst files, you can always customize.

    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79
    let python_highlight_all=1
    let python_highlight_exceptions=0
    let python_highlight_builtins=0

<br />
#    Colors!

Don't forget your color scheme!

    colorscheme solarized


<br />
If you think this setup might be right for you. Feel free to check out how I did it on [github](https://github.com/bufordtaylor/dot_files)
