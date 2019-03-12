(setq org-directory "~/Box Sync/org")

;; Go to Org Directory
(global-set-key (kbd "C-c c o") (lambda() (interactive) (dired org-directory)))

