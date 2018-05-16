(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-plsense)

(provide 'setup-company-mode)
