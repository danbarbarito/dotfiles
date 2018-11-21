(require 'perltidy)

(defalias 'perl-mode 'cperl-mode)

(setq
 cperl-close-paren-offset -4
 cperl-continued-statement-offset 4
 cperl-indent-level 4
 cperl-indent-parens-as-block t
 cperl-tabs-always-indent t)

(provide 'init-perl)
