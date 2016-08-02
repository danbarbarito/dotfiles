;;; org-mode

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook 'org-bullets-mode)

;; (global-set-key (kbd "C-c r") 'remember)
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (setq org-remember-templates
;;       '((?n "* %U %?" "~/org/inbox.org")))
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))

;; org bindings
(global-set-key (kbd "C-c g o") (lambda () (interactive) (dired "~/Dropbox/org")))
(global-set-key (kbd "C-c c w") 'org-pomodoro)

(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/school.org"
                             "~/Dropbox/org/home.org"))
