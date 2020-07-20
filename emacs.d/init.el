;;
;; Package Management
;;
(if (file-readable-p "~/.cask/cask.el")
  (require 'cask "~/.cask/cask.el")
  (if (file-readable-p "/usr/local/share/emacs/site-lisp/cask/cask.el")
        (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")))
(cask-initialize)
(require 'pallet)

;;
;; And after that, let's make sure we're not binding META on a mac like an animal
;;
(setq mac-option-modifier  'meta)
(setq mac-command-modifier 'super)
;;
;; Load the org-mode configuration file
;;
(org-babel-load-file "~/.emacs.d/configuration.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode dash-at-point js2-mode js2 auto-complete php-mode org multi-term expand-region use-package)))
 '(tramp-histfile-override nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
