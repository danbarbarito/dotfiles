(when (maybe-require-package 'd-mode))

(add-hook 'd-mode-hook 'company-dcd-mode)

(provide 'init-d)
