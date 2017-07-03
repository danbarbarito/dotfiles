;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor/")

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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(auto-indent-on-save-file t)
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-begin-commands
   (quote
    (self-insert-command org-self-insert-command orgtbl-self-insert-command c-scope-operator c-electric-colon c-electric-lt-gt c-electric-slash)))
 '(company-go-gocode-command "/Users/danbarbarito/.go/bin/gocode")
 '(company-minimum-prefix-length 3)
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(elpy-rpc-backend "rope")
 '(elpy-rpc-python-command "python3")
 '(exec-path-from-shell-check-startup-files nil)
 '(fci-rule-color "#373b41")
 '(gofmt-command "/Users/danbarbarito/.go/bin/goimports")
 '(helm-grep-ag-command "ag --line-numbers -S --color %s %s %s")
 '(js2-highlight-level 3)
 '(linum-relative-current-symbol "")
 '(package-selected-packages
   (quote
    (exec-path-from-shell elpy immortal-scratch js2-refactor helm pp-c-l emmet-mode projectile company-web ido-vertical-mode ido-ubiquitous yasnippet lorem-ipsum redo+ auto-indent-mode stylus-mode go-autocomplete company-go go-mode yaml-mode web-mode visual-regexp use-package unicode-fonts textmate smartparens smart-mode-line slime sequential-command scss-mode robe rainbow-mode prodigy popwin pallet ox-pandoc ox-leanpub ox-asciidoc org-trello org-plus-contrib on-screen nyan-mode multiple-cursors moz markdown-mode magit lua-mode key-chord jsx-mode json-mode js2-mode iedit idle-highlight-mode htmlize howdoi highlight-symbol highlight-indentation haskell-mode graphviz-dot-mode gist geiser flycheck flx-ido fish-mode feature-mode expand-region epresent ensime editorconfig drag-stuff discover-my-major dired+ diff-hl deft company-tern company-emoji color-theme-sanityinc-tomorrow coffee-mode cider buffer-move back-button ag adoc-mode ace-jump-mode)))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".sass-cache")))
 '(ring-bell-function (quote ignore))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-attr-indent-offset nil)
 '(web-mode-attr-value-indent-offset nil)
 '(web-mode-block-padding 0)
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-indentation t)
 '(web-mode-jsx-depth-faces nil))
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
