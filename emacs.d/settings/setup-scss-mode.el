(require 'scss-mode)
;; (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
;; (add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . css-mode))

(provide 'setup-scss-mode)
