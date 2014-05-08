(provide 'init-bootstrap)
(require 'cl)
(require 'cl-lib)

(push "/usr/local/bin" exec-path)
(push "/usr/bin" exec-path)
(push "/usr/local/share/npm/bin" exec-path)
(push (expand-file-name "~/scripts") exec-path)
(setenv "PATH" (concat "/usr/local/bin:" (expand-file-name "~/scripts") ":" (getenv "PATH")))
(setenv "PAGER" "emacsclient")

(cd "~")

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(modify-all-frames-parameters '((fullscreen . maximized)))
(setq package-archives nil)
(package-initialize)

;;; quelpa

 (if (require 'quelpa nil t)
     (quelpa '(quelpa :repo "quelpa/quelpa" :fetcher github) :upgrade t)
   (with-temp-buffer
     (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
     (eval-buffer)))

(quelpa 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
