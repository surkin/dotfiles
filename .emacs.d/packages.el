(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(defvar required-packages '(
    auctex
    color-theme
    dash
    ensime
    evil
    evil-leader
    evil-nerd-commenter
    evil-numbers
    evil-surround
    erc
    ess
    flycheck
    free-keys
    git-messenger
    go-mode
    haskell-mode
    json-mode
    lua-mode
    magit
    markdown-mode
    multiple-cursors
    rfringe
    scala-mode2
    smooth-scroll
    org
    popup
    powerline
    projectile
    protobuf-mode
    puppet-mode
    python-mode
    w3m
    xclip
    yaml-mode
    zenburn-theme
  )
  "Packages which should be installed upon launch"
)

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))
