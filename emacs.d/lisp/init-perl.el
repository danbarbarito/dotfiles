(require 'perltidy)

(defalias 'perl-mode 'cperl-mode)


;; Perl tidy on save
(add-hook 'cperl-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-s") 'perltidy-buffer)))

(provide 'init-perl)
