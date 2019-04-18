(require 'perltidy)

(defun my-perl-hook ()
  (setq cperl-indent-level 2)
  (add-hook 'before-save-hook #'perltidy-buffer nil t))

(setq prelude-cperl-mode-hook '(prelude-cperl-mode-defaults
                                my-perl-hook
                                ))
