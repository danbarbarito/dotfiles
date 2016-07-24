(setq my-credentials-file "~/.private.el")

(defun my-nickserv-password (_)
  (with-temp-buffer
    (insert-file-contents-literally my-credentials-file)
    (plist-get (read (buffer-string)) :nickserv-password)))

(setq circe-network-options
      '(("Freenode"
         :nick "GnuYawk"
         :channels ("#emacs" "##politics" "#web" "#go-nuts" "#ruby" "#rubyonrails")
         :nickserv-password my-nickserv-password)))

(load "lui-logging" nil t)
(enable-lui-logging-globally)

(require 'lui-autopaste)
(add-hook 'circe-channel-mode-hook 'enable-lui-autopaste)

(require 'circe-color-nicks)
(add-hook 'circe-channel-mode-hook 'enable-circe-color-nicks)

(global-set-key (kbd "C-x c") 'circe)
