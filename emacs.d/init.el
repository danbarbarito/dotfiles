;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/Cellar/cask/0.8.1/cask.el")
(cask-initialize)
(require 'org)
(setq org-confirm-babel-evaluate nil
      vc-follow-symlinks nil)

(org-babel-load-file "~/.emacs.d/README.org")
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-go-gocode-command "/Users/danbarbarito/.go/bin/gocode")
 '(package-selected-packages
   (quote
    (go-autocomplete company-go go-mode yaml-mode web-mode visual-regexp use-package unicode-fonts textmate smex smartparens smart-mode-line slime sequential-command scss-mode robe rainbow-mode prodigy popwin pallet ox-pandoc ox-leanpub ox-asciidoc org-trello org-plus-contrib on-screen nyan-mode multiple-cursors moz markdown-mode magit lua-mode key-chord jsx-mode json-mode js2-mode iedit idle-highlight-mode htmlize howdoi highlight-symbol highlight-indentation helm-swoop helm-projectile helm-ls-git helm-git-grep helm-ag haskell-mode graphviz-dot-mode gist geiser flycheck flx-ido fish-mode feature-mode expand-region epresent ensime editorconfig drag-stuff discover-my-major dired+ diff-hl deft company-tern company-emoji color-theme-sanityinc-tomorrow coffee-mode cider buffer-move back-button ag adoc-mode ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
