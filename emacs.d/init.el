
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (async cask dash expand-region f flycheck git-commit haskell-mode inf-ruby magit-popup package-build package-lint projectile s with-editor pdf-tools yasnippet yard-mode yaml-mode wrap-region wgrep web-mode w3m solarized-theme smex smart-forward scss-mode rust-mode ruby-hash-syntax ruby-end ruby-compilation rubocop rspec-mode rhtml-mode rainbow-mode rainbow-delimiters python-mode projectile-rails php-mode paredit paperless pallet ox-twbs org-bullets muttrc-mode multi-term markdown-mode magit less-css-mode jump js2-mode ido-vertical-mode ido-ubiquitous htmlize header2 haml-mode graphviz-dot-mode gnuplot gitignore-mode gitconfig-mode git-timemachine ghc geiser flycheck-rust flycheck-package flx-ido fill-column-indicator erlang engine-mode dockerfile-mode dired-open dired-details dired+ diminish diff-hl dash-at-point company coffee-mode cm-mode chruby auctex ag)))
 '(paperless-capture-directory "/Volumes/Media/File Cabinet/Inbox")
 '(paperless-root-directory "/Volumes/Media/File Cabinet")
 '(pdf-tools-handle-upgrades nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; Install epdfinfo via 'brew install pdf-tools' and then install the
;;; pdf-tools elisp via the use-package below. To upgrade the epdfinfo
;;; server, just do 'brew upgrade pdf-tools' prior to upgrading to newest
;;; pdf-tools package using Emacs package system. If things get messed
;;; up, just do 'brew uninstall pdf-tools', wipe out the elpa
;;; pdf-tools package and reinstall both as at the start.
(require 'use-package)
(use-package pdf-tools
  :ensure t
  :config
  (custom-set-variables
    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
(pdf-tools-install)
