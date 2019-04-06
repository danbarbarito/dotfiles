(require 'eslint-fix)

(setq js2-basic-offset 2)

(add-hook 'js2-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))
