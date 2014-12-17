(provide 'init-prolog)

;; default to prolog instead of perl
(add-to-list 'auto-mode-alist '("\.pl$" . prolog-mode))
