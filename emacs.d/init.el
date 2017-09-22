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
 '(ag-highlight-search t)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#1c2023" "#c7ae95" "#95c7ae" "#aec795" "#ae95c7" "#c795ae" "#ae95c7" "#c7ccd1"])
 '(ansi-term-color-vector
   [unspecified "#1c2023" "#c7ae95" "#95c7ae" "#aec795" "#ae95c7" "#c795ae" "#ae95c7" "#c7ccd1"] t)
 '(auto-indent-on-save-file t)
 '(cmake-project-default-build-dir-name "")
 '(comment-padding 1)
 '(comment-style (quote indent))
 '(company-auto-complete nil)
 '(company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 62 47 124 33)))
 '(company-begin-commands
   (quote
    (self-insert-command org-self-insert-command orgtbl-self-insert-command c-scope-operator c-electric-colon c-electric-lt-gt c-electric-slash)))
 '(company-cmake-executable "cmake")
 '(company-go-gocode-command "/Users/danbarbarito/.go/bin/gocode")
 '(company-minimum-prefix-length 3)
 '(company-tooltip-limit 10)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("ec3e6185729e1a22d4af9163a689643b168e1597f114e1cec31bdb1ab05aa539" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "304c39b190267e9b863c0cf9c989da76dcfbb0649cbcb89592e7c5c08348fce9" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "80930c775cef2a97f2305bae6737a1c736079fdcc62a6fdf7b55de669fbbcd13" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(elpy-rpc-backend "rope")
 '(elpy-rpc-python-command "python3")
 '(enable-completion nil)
 '(exec-path-from-shell-check-startup-files nil)
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(gofmt-command "/Users/danbarbarito/.go/bin/goimports")
 '(grep-command "grep  -nH -e ")
 '(grep-find-template nil)
 '(helm-M-x-fuzzy-match t)
 '(helm-grep-ag-command "ag --line-numbers -S --color %s %s %s")
 '(ido-auto-merge-work-directories-length -1)
 '(ido-everywhere t)
 '(immortal-scratch-mode t)
 '(js2-highlight-level 3)
 '(linum-relative-current-symbol "")
 '(package-selected-packages
   (quote
    (ac-helm smart-tab find-file-in-project ivy org vue-html-mode ox-leanpub ag cmake-mode cmake-project vc-fossil what-the-commit ack base16-theme function-args ggtags helm-flx org-bullets web-beautify cargo rust-mode company-quickhelp exec-path-from-shell elpy js2-refactor helm pp-c-l emmet-mode company-web ido-vertical-mode ido-ubiquitous lorem-ipsum redo+ auto-indent-mode stylus-mode go-autocomplete company-go go-mode yaml-mode web-mode visual-regexp unicode-fonts textmate smartparens smart-mode-line sequential-command robe rainbow-mode popwin pallet ox-asciidoc org-trello on-screen nyan-mode multiple-cursors moz markdown-mode magit lua-mode key-chord jsx-mode json-mode js2-mode iedit idle-highlight-mode htmlize howdoi highlight-symbol highlight-indentation haskell-mode graphviz-dot-mode gist geiser flycheck flx-ido fish-mode feature-mode expand-region epresent ensime editorconfig drag-stuff discover-my-major dired+ diff-hl deft company-tern company-emoji color-theme-sanityinc-tomorrow coffee-mode cider buffer-move back-button adoc-mode ace-jump-mode)))
 '(parse-sexp-ignore-comments t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".sass-cache")))
 '(projectile-project-root-files
   (quote
    ("rebar.config" "build.boot" "SConstruct" "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile" "requirements.txt" "setup.py" "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION" "TAGS" "GTAGS")))
 '(python-shell-interpreter "ipython")
 '(ring-bell-function (quote ignore))
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tab-width 2)
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
 '(vue-html-tab-width 0)
 '(web-mode-attr-indent-offset nil)
 '(web-mode-attr-value-indent-offset nil)
 '(web-mode-auto-close-style 1)
 '(web-mode-block-padding 0)
 '(web-mode-code-indent-offset 2)
 '(web-mode-commands-like-expand-region nil)
 '(web-mode-enable-auto-closing nil)
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
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(dired-directory ((t (:inherit font-lock-function-name-face)))))
