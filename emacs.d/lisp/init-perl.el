(require 'perltidy)

(defalias 'perl-mode 'cperl-mode)

(setq
 cperl-close-paren-offset -4
 cperl-continued-statement-offset 4
 cperl-indent-level 4
 cperl-indent-parens-as-block t
 cperl-tabs-always-indent t )

(defadvice cperl-backward-to-start-of-continued-exp (after indentation-fix)
  (and (not (memq char-after '(?\) ?\})))
       (or (not is-block) (looking-back "^[ \t]+"))
       (> (current-column) cperl-continued-statement-offset)
       (backward-char cperl-continued-statement-offset)))

(provide 'init-perl)
