(require 'perltidy)

(setq cperl-indent-level 2)

(add-hook 'cperl-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'perltidy-buffer nil t)))
