;;; Fuzzy matching for Emacs ... a la Sublime Text.

(package 'helm-projectile)

(helm-mode 1)

;; Key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; http://emacs.stackexchange.com/questions/8205/why-does-helm-find-files-change-behavior-depending-on-my-current-location/12423#12423
;; (ad-deactivate 'ffap-file-at-point)
(defadvice ffap-file-at-point (after ffap-file-at-point-after-advice ())
  (if (string= ad-return-value "/")
      (setq ad-return-value nil)))
(ad-activate 'ffap-file-at-point)
