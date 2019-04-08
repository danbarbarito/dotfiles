(setq org-modules
  (quote
   (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-collector)))

(setq org-directory "~/org")

;; Go to Org Directory
(defun go-to-org-directory () (interactive) (dired org-directory))
(global-set-key (kbd "C-c c o") 'go-to-org-directory)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t)
   (shell . t)
   (perl . t)))

(add-hook 'org-mode-hook #'(lambda ()

                             ;; make the lines in the buffer wrap around the edges of the screen.
                             
                             ;; to press C-c q  or fill-paragraph ever again!
                             (visual-line-mode)))
