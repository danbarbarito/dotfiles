(setq org-directory "~/Box Sync/org")

;; Go to Org Directory
(defun go-to-org-directory () (interactive) (dired org-directory))
(global-set-key (kbd "C-c c o") 'go-to-org-directory)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t)
   (shell . t)
   (perl . t)))
