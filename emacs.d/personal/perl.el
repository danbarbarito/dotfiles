(defun perl-mode-disable-auto-indent()
  (electric-indent-mode -1))
(add-hook 'cperl-mode-hook 'perl-mode-disable-auto-indent)
