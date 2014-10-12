(provide 'init-dired)

(require 'dired+)

(setq ls-lisp-use-insert-directory-program t)
(setq insert-directory-program "gls")
(setq wdired-allow-to-change-permissions t)
(setq dired-listing-switches "-alh")
(define-key dired-mode-map (kbd "M-e") 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "TAB") 'dired-hide-details-mode)

(define-key dired-mode-map (kbd "b") nil)
(define-key dired-mode-map (kbd "e") nil)
(define-key dired-mode-map (kbd "-") nil)
(define-key dired-mode-map (kbd "E") nil)

