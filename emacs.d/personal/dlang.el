(require 'company-dcd)

'(add-to-list
  'company-backends '(company-dcd))

(eval-after-load 'd-mode
  '(add-hook 'd-mode-hook (lambda () (company-dcd-mode))))
