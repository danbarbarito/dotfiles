(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'scss-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

(provide 'setup-emmet-mode)
