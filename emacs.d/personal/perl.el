(require 'perltidy)

(add-hook 'cperl-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'perltidy-buffer nil t)))
