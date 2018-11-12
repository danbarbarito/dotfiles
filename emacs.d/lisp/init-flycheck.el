(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

  (when (maybe-require-package 'flycheck-color-mode-line)
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))


  '(flycheck-clang-language-standard "c++14")
  '(flycheck-clang-include-path (quote ("thirdparty/"))))


(provide 'init-flycheck)
