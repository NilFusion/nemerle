" Vim syntax file
"
" Copyright (c) 2003 The University of Wroclaw.
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions
" are met:
"    1. Redistributions of source code must retain the above copyright
"       notice, this list of conditions and the following disclaimer.
"    2. Redistributions in binary form must reproduce the above copyright
"       notice, this list of conditions and the following disclaimer in the
"       documentation and/or other materials provided with the distribution.
"    3. The name of the University may not be used to endorse or promote
"       products derived from this software without specific prior
"       written permission.
" 
" THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY ``AS IS'' AND ANY EXPRESS OR
" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
" OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
" NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
" SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
" TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
" PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
" LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
" NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
" SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"
" Language:    Nemerle
" Maintainer:  Michal Moskal <malekith@pld-linux.org>
" Last Change: $LastChangedDate$
" Version:     1.00
" Revision:    $Rev$

" Adapted from gont.vim file.

" To use this file, copy it to ~/.vim/syntax/ and enter the following to
" ~/.vim/filetype.vim (create one if you don't already have it):
"
"	augroup filetypedetect
"		autocmd BufNewfile,BufRead *.n setfiletype nemerle
"	augroup END
"
" Additionally, since nemerlec assumes utf-8 encoding of input files, you 
" can add following to your ~/.vimrc file:
"
"	augroup nemerle
"		au!
"		autocmd BufNewfile,BufReadPre *.n
"			\ set fencs=utf-8,iso-8859-2 fenc=utf-8
"	augroup END
"
" Have fun :)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" in fact char ain't keyword, nor option and list are... 
syn keyword nemerleType int bool string void option list char float object

syn keyword nemerleKeyword abstract const extern internal new private protected sealed volatile
syn keyword nemerleKeyword class enum extends finally in null out public raise ref struct
syn keyword nemerleKeyword variant interface implements namespace where type let static
syn keyword nemerleKeyword in fun and tymatch with try open void base if then else variant letfun
syn keyword nemerleKeyword match as record

syn keyword nemerleConst null true false this

syn match	nemerleSpec	"[()\]\[]\|\*\["
syn match	nemerleNumber "0[xX][0-9a-fA-F]\+"
syn match	nemerleNumber "0[bB][01]\+"
syn match	nemerleNumber "0[oO][0-7]\+"
syn match	nemerleNumber "[0-9]\+\((\.[0-9]*)\)\?\([eE]\([+-]\)\?[0-9]*\)\?"

syn match	nemerleTyVar	"'[a-zA-Z_][a-zA-Z_0-9]*"
syn match	nemerleChar	"'\(.\|\\.\|\\x\x\x\)'"

" syn match	nemerleUIdentifier	"[A-Z][a-zA-Z_0-9]*"
syn match	nemerleIdentifier	"[a-z_][a-zA-Z_0-9]*"

syn match	nemerleTyArg	"[<>]"

" Comments
syn keyword nemerleTodo	contained	XXX TODO FIXME
syn cluster nemerleCommentGroup	contains=nemerleTodo
syn match nemerleComment	"//.*$"	contains=@nemerleCommentGroup
syn region nemerleComment start="(\*" end="\*)" contains=@nemerleCommentGroup

syn match	nemerleModPrefix	"[A-Za-z_][a-zA-Z_0-9]*\."

syn match	nemerleSpecial	display contained "\\\(x\x\x\|.\|$\)"
syn region	nemerleString	start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=nemerleSpecial

" synchronization
syn sync lines=500

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_nemerle_syntax_inits")
  if version < 508
    let did_lisp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

"  HiLink nemerleIdentifier	Identifier
"  HiLink nemerleUIdentifier	Constant
  HiLink nemerleModPrefix	Include
  HiLink nemerleComment	Comment
  HiLink nemerleKeyword	Statement
  HiLink nemerleString	String
  HiLink nemerleChar	Character
  HiLink nemerleType	Type
  HiLink nemerleMacro	Macro
  HiLink nemerleSpec	Special
  HiLink nemerleTyVar	Special
  HiLink nemerleNumber	Number
  HiLink nemerleConst	Constant
  HiLink nemerleTodo	Todo
  
  HiLink nemerleTyArg	Type

" HiLink	nemerleErrInParen	Error
" HiLink	nemerleErrInBracket	Error
  delcommand HiLink
endif

let b:current_syntax = "nemerle"

" vim: nowrap
