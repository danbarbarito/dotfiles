(require 'perltidy)

(add-hook 'cperl-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'perltidy-buffer nil t)))
