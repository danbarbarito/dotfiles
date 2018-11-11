(when (maybe-require-package 'nim-mode)
  (add-hook 'nim-mode-hook 'nimsuggest-mode))

(provide 'init-nim)
