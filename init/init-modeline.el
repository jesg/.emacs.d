(provide 'init-modeline)

(setq-default mode-line-format
              '(
                (:eval (propertize "%3l" 'face 'mode-line-line-position-face))

                (:eval (propertize "%3c" 'face
                                   (if (>= (current-column) 75)
                                       'mode-line-80col-face
                                     'mode-line-position-face)))


                                        ; read-only or modified status
                (:eval
                 (cond (buffer-read-only
                        (propertize "!RO" 'face 'mode-line-read-only-face))
                       ((buffer-modified-p)
                        (propertize "!**" 'face 'mode-line-modified-face))
                       (t(propertize " λ " 'face 'mode-line-folder-face))))
                                        ; emacsclient [default -- keep?]
                ;; mode-line-client
                                        ; directory and buffer/file name
                " "
                (:propertize (:eval (shorten-directory default-directory 10))
                             face mode-line-folder-face)
                (:propertize "%b"
                             face mode-line-filename-face)
                "  ("
                (:propertize mode-name
                             face mode-line-mode-face)
                ") "
                                        ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
                (:propertize (vc-mode vc-mode)
                             face mode-line-minor-mode-face)

                (:eval (propertize (format-mode-line minor-mode-alist)
                                   'face 'mode-line-minor-mode-face))
                (:propertize mode-line-process
                             face mode-line-process-face)
                (global-mode-string global-mode-string)
                                        ; nyan-mode uses nyan cat as an alternative to %p
                ;; (:eval (when nyan-mode (list (nyan-create))))
                ))



;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; ;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

