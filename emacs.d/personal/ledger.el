(require 'pcomplete)
(require 'ledger-mode)

;; To open files with .journal extension in hledger-mode
(add-to-list 'auto-mode-alist '("\\.journal\\'" . ledger-mode))
