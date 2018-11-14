(when (maybe-require-package 'cmake-ide)
  (when (maybe-require-package 'rtags)
    (cmake-ide-setup)))


(provide 'init-cmake-ide)
