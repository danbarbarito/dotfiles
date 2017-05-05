(load-theme 'sanityinc-tomorrow-eighties t)

;;      (set-fontset-font t 'han '("PingFang SC"))
(require 'unicode-fonts)
(unicode-fonts-setup)
(set-default-font "Monaco-14:width=condensed:weight=light")

(defun darwin-set-emoji-font (frame)
  "Adjust the font settings of FRAME so Emacs NS/Cocoa can display emoji properly."
  (if (eq system-type 'darwin)
      (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)))
;; For when emacs is started with Emacs.app
(darwin-set-emoji-font nil)
;; Hook for when a cocoa frame is created with emacsclient
;; see https://www.gnu.org/software/emacs/manual/html_node/elisp/Creating-Frames.html
(add-hook 'after-make-frame-functions 'darwin-set-emoji-font)



(defun my-add-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . ?λ)
          ("->" . ?→)
          ("=>" . ?⇒)
          ("!=" . ?≠)
          ("===" . ?≡)
          ("!==" . ?≢)
          (">=" . ?⩾)
          ("<=" . ?⩽)
          ("<|" . ?⊲)
          ("|>" . ?⊳)
          (">->" . ?↣)
          ("~>" . ?↝)
          (">=>" . ?⟾)
          )))

(add-hook 'clojure-mode-hook 'my-add-pretty-lambda)
(add-hook 'haskell-mode-hook 'my-add-pretty-lambda)
(add-hook 'js2-mode-hook 'my-add-pretty-lambda)
(add-hook 'javascript-mode-hook 'my-add-pretty-lambda)
(add-hook 'coffee-mode-hook 'my-add-pretty-lambda)

(global-prettify-symbols-mode 1)

(server-start) ;
(global-superword-mode 1)
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)); 
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(delete-selection-mode 1) ; delete selection when paste
(keyboard-translate ?\C-h ?\C-?); 
(global-auto-revert-mode 1)  ;auto revert buffers when changed on dis
(global-diff-hl-mode)
(add-hook 'local-write-file-hooks
          (lambda ()
            (delete-trailing-whitespace)
            nil))
(setq-default
 make-backup-files nil ; stop creating those backup~ file
 auto-save-default nil

 indent-tabs-mode nil                   ;use spaces instead of tabs
 c-hungry-delete-key t                  ;delete more than one space
 electric-pair-mode nil
 )
(electric-indent-mode t)

(when (file-readable-p ".user.el") (load ".user.el"))

(add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))

(require 'cider)
  (setq org-babel-clojure-backend 'cider)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  ;; (setq nrepl-log-messages t
  ;;       cider-repl-use-clojure-font-lock t
  ;;       cider-font-lock-dynamically '(macro core function var)
  ;;       nrepl-hide-special-buffers t
  ;;       cider-overlays-use-font-lock t)

(require 'company)
(require 'company-tern)
;; (require 'company-ispell)
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-yasnippet t)
(add-to-list 'company-backends 'company-robe)
;; (add-to-list 'company-backends 'company-ispell)
;; not always down case
(setq company-dabbrev-downcase nil)
(setq company-tooltip-align-annotations t)
(setq company-idle-delay 0.1)
(global-company-mode)

(setq
 deft-extension "org"
 deft-directory "~/Develop/blog/org"
 deft-text-mode 'org-mode
 deft-recursive t
 deft-use-filename-as-title nil
 deft-file-naming-rules
 '((noslash . "-")
   (nospace . "-")
   (case-fn . downcase))
 deft-use-filter-string-for-filename t
 deft-org-mode-title-prefix t
 )

(require 'helm-config)
(require 'helm-git-grep)
(helm-mode 1)
(helm-autoresize-mode 1)
(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(setq projectile-completion-system 'helm
      helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-ag-fuzzy-match t ;
      projectile-enable-caching t; 
      helm-locate-fuzzy-match t
      projectile-indexing-method 'alien); 
(helm-projectile-on)

(require 'iedit)
(setq iedit-unmatched-lines-invisible-default t)

(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.sjs$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
(setq js2-allow-rhino-new-expr-initializer nil)
(setq js2-enter-indents-newline t)
(setq js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
(setq js2-idle-timer-delay 0.1)
(setq js2-indent-on-enter-key nil)
(setq js2-mirror-mode nil)
(setq js2-strict-inconsistent-return-warning nil)
(setq js2-auto-indent-p t)
(setq js2-include-rhino-externs nil)
(setq js2-include-gears-externs nil)
(setq js2-concat-multiline-strings 'eol)
(setq js2-rebind-eol-bol-keys nil)
(setq js2-mode-show-parse-errors t)
(setq js2-mode-show-strict-warnings nil)

(add-hook 'ruby-mode-hook 'robe-mode)
;(setq rbenv-installation-dir "/usr/local/bin/")
;(defadvice inf-ruby-console-auto (before activate-rbenv-for-robe activate)
;  (rbenv-use-corresponding))

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))

(nyan-mode t)

(setq tex-compile-commands '(("xelatex %r")))
(setq tex-command "xelatex")
(setq-default TeX-engine 'xelatex)

(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(setq locate-command "mdfind")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/share/npm/bin:/usr/local/bin:/usr/texbin"))
(setq exec-path (append exec-path '("/usr/local/bin" "~/.rbenv/shims" "/usr/texbin")))

(on-screen-global-mode 1)
(setq on-screen-highlight-method 'narrow-line)

(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.03)

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("tufte" "\\documentclass[11pt,twoside,openright]{tufte-book}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(setq org-directory "~/Dropbox/org")
(let ((todo "~/Dropbox/org/todo.org"))
  (when (file-readable-p todo)
    (setq org-agenda-files (file-expand-wildcards "~/Dropbox/**/*.org")) 
    (setq initial-buffer-choice (lambda ()
                                  (org-agenda nil "n")
                                  (delete-other-windows)
                                  (current-buffer)
                                  ))
    ))
(setq org-default-notes-file "~/Dropbox/org/refile.org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/org/mobile")

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-startup-folded 'nofold)
(setq org-startup-indented t)
(setq org-startup-with-inline-images t)
(setq org-startup-truncated t)
(setq org-refile-targets '((org-agenda-files :maxlevel . 5)))
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-use-speed-commands t)
(setq org-default-notes-file (concat org-directory "/todo.org"))

(add-to-list 'org-structure-template-alist '("E" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC\n"))
(add-to-list 'org-structure-template-alist '("S" "#+BEGIN_SRC shell-script\n?\n#+END_SRC\n"))
(add-to-list 'org-structure-template-alist '("J" "#+BEGIN_SRC js\n?\n#+END_SRC\n"))
(add-to-list 'org-structure-template-alist '("jm" "#+BEGIN_SRC js :session mozilla\n?\n#+END_SRC\n"))
(add-to-list 'org-structure-template-alist '("C" "#+BEGIN_SRC clojure\n?\n#+END_SRC\n"))
(add-to-list 'org-structure-template-alist '("d" "#+BEGIN_SRC ditaa :file ? :exports results\n?#+END_SRC\n"))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;;  (require 'org-trello)
(setq org-default-notes-file (concat org-directory "/todo.org"))
;; (custom-set-variables '(org-trello-files `(,org-default-notes-file)))

(setq org-capture-templates
      '(
        ("t" "Todo" entry (file org-default-notes-file) "* TODO %?\n  %u\n  %a")
        ("s" "Simple Task" entry (file org-default-notes-file) "* TODO %?\n  %U\n")
        ))
(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "IN PROGRESS(p!)"
         "HOLD(h!)"
         "WAITING(w)"
         "SOMEDAY(s)"
         "|"
         "DONE(d!)"
         "CANCELLED(c)"
         )))
(setq org-todo-keyword-faces
      '(
        ("IN PROGRESS" . 'warning)
        ("DOING" . 'warning)
        ("HOLD" . 'font-lock-keyword-face)
        ("WAITING" . 'font-lock-builtin-face)
        ("SOMEDAY" . 'font-lock-doc-face)
        ))
(setq org-log-into-drawer t)

(setq org-html-validation-link nil)
(setq org-publish-project-alist
      '(("fpjs-static"
         :base-directory "~/Documents/Books/functional-javascript/images"
         :base-extension "png\\|jpg\\|jpeg\\|gif"
         :publishing-directory "~/Dropbox/functional-javascript/manuscript/images"
         :recursive t
         :publishing-function org-publish-attachment)
        ("fpjs-md"
         :base-directory "~/Documents/Books/functional-javascript"
         :base-extension "org"
         :publishing-directory "~/Dropbox/functional-javascript/manuscript"
         :sub-superscript ""
         :recursive t
         :publishing-function org-leanpub-publish-to-leanpub
         :html-extension "md"
         :body-only t)
        ("fpjs" :components ("fpjs-static" "fpjs-md"))))

(setq org-deck-base-url "https://blog.oyanglul.us/deck.js")
(setq org-deck-theme "web-2.0.css")
(setq org-deck-transition "horizontal-slide.css")
(setq org-deck-postamble "<p>%t - %a</p>")

;; create the file for the agendas if it doesn't exist
(appt-activate 1)              ; activate appt (appointment notification)

(org-agenda-to-appt)           ; add appointments on startup

;; add new appointments when saving the org buffer, use 'refresh argument to do it properly
(defun my-org-agenda-to-appt-refresh () (org-agenda-to-appt 'refresh))
(defun my-org-mode-hook ()
  (add-hook 'after-save-hook 'my-org-agenda-to-appt-refresh nil 'make-it-local))
(add-hook 'org-mode-hook 'my-org-mode-hook)
(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode 1)))
(require 'notifications)
(defun my-appt-disp-window-function (min-to-app new-time msg)
  (notifications-notify :title (format "Appointment in %s min" min-to-app) :body msg))
(setq appt-disp-window-function 'my-appt-disp-window-function)
(setq appt-delete-window-function (lambda (&rest args)))

;; add state to the sorting strategy of todo
(setcdr (assq 'todo org-agenda-sorting-strategy) '(todo-state-up priority-down category-keep))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)
   (clojure . t)
   ))

(setq org-pandoc-options-for-revealjs '(
                                          (self-contained . t)
(variable . "theme=solarized")
(section-divs . t)
                                          (standalone . nil)))

(require 'pallet)
(pallet-mode t)

(require 'smartparens-config)
(smartparens-global-mode t)

(show-smartparens-global-mode t)

(add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

(require 'sequential-command)
(define-sequential-command seq-home
  back-to-indentation beginning-of-line seq-return)
(define-sequential-command seq-end
  end-of-line end-of-buffer seq-return)
(global-set-key "\C-a" 'seq-home)
  (global-set-key "\C-e" 'seq-end)
(define-sequential-command seq-company-tab company-complete-common company-complete-selection)

(define-key company-active-map (kbd "TAB") 'seq-company-tab)
(define-key company-active-map [tab] 'seq-company-tab)

(require 'ensime)
  (add-to-list 'auto-mode-alist '("\\.sc$" . scala-mode))
  (add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
  (add-hook 'scala-mode-hook 'ensime-mode)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (tern-mode t)))

(require 'textmate)
(textmate-mode)
(bind-keys
 :map *textmate-mode-map*
 ("M-}" . textmate-shift-right)
 ("M-{" . textmate-shift-left)
 ("M-/" . comment-or-uncomment-region-or-line)
 ("M-l" . textmate-select-line)
 )

(defalias 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(require 'editorconfig)
(editorconfig-mode 1)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(yas-global-mode 1)

(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar")

(bind-keys
 :map smartparens-mode-map
 ("C-M-f" . sp-forward-sexp)
 ("C-M-b" . sp-backward-sexp)
 ("C-S-i" . sp-down-sexp)
 ("C-S-o" . sp-up-sexp)
 ("M-A-i" . sp-backward-down-sexp)
 ("M-A-o" . sp-backward-up-sexp)
 ("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp)
 ("C-M-n" . sp-next-sexp)
 ("C-M-p" . sp-previous-sexp)
 ("C-M-d" . sp-kill-sexp)
 ("C-M-<backspace>" . sp-backward-kill-sexp)
 ("C-M-k" . sp-kill-hybrid-sexp)
 ("C-M-w" . sp-copy-sexp)
 ("C-M-[" . sp-backward-unwrap-sexp)
 ("C-M-]" . sp-unwrap-sexp)
 ("C-<right>" . sp-forward-slurp-sexp)
 ("C-<left>" . sp-forward-barf-sexp)
 ("C-M-<left>" . sp-backward-slurp-sexp)
 ("C-M-<right>" . sp-backward-barf-sexp))

(bind-keys
 ("C-c h o" . helm-occur)
 ("C-c h x" . helm-register)
 ("M-x" . helm-M-x)
 ("C-x b" . helm-mini)
 ("M-y" . helm-show-kill-ring))
(bind-keys
 :map helm-map
 ("<tab>" . helm-execute-persistent-action) ; rebind tab to run persistent action
 ("C-i" . helm-execute-persistent-action) ; make TAB works in terminal
 ("C-z" . helm-select-action) ; list actions using C-z
 )

(bind-keys
 ("C-<" . mc/mark-previous-like-this)
 ("C->" . mc/mark-next-like-this)
 ("C-*" . mc/mark-all-like-this))

(bind-keys
 ("M-c" . kill-ring-save)
 ("C-8" . er/expand-region)
 ("M-8" . er/contract-region)
 ("C-x r" . vr/query-replace)
 ("M--" . text-scale-decrease)
 ("M-=" . text-scale-increase)
 ("C-c i" . (lambda () (interactive) (indent-region (point-min) (point-max))))
 ("M-<backspace>" . kill-whole-line)
 ("C-c r" . revert-buffer)
 ("C-3" . back-button-global-backward)
 ("C-4" . back-button-global-forward)
 ("C-c SPC" . ace-jump-mode)
 ("C-c h d" . howdoi-query-insert-code-snippet-at-point)
 ("M-k" . delete-other-windows)
 ("<f7>" . toggle-window-split)
 ("C-c c" . deft)
 ("C-x t" . org-capture)
 ("C-c a" (lambda () (interactive) (org-agenda nil "n"))))

(key-chord-define-global "vr" 'vr/replace)
(key-chord-define-global "ln" 'linum-mode)
