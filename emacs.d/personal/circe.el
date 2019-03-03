(prelude-require-package 'circe)

(setq my-credentials-file "~/.private.el")

(when (file-exists-p my-credentials-file)

  (defun my-nickserv-password (server)
    (with-temp-buffer
      (insert-file-contents-literally my-credentials-file)
      (plist-get (read (buffer-string)) :nickserv-password)))


  (setq circe-network-options
        '(
          (
           "Freenode"
           :tls t
           :realname "Fricks"
           :nick "Fricks"
           :channels ()
           :nickserv-password my-nickserv-password
           )
          )))
