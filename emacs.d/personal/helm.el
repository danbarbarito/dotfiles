;;; Fuzzy matching for Emacs ... a la Sublime Text.

(package 'helm-projectile)

(helm-mode 1)

;; Key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
