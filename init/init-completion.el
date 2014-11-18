(provide 'init-completion)

(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load "company"
  '(progn
     (define-key company-active-map (kbd "<tab>") nil)
     (define-key company-active-map (kbd "ESC") 'company-abort)
     (define-key company-active-map (kbd "<C-return>") 'company-abort)
     (define-key company-active-map (kbd "C-n") 'company-select-next)
     (define-key company-active-map (kbd "C-p") 'company-select-previous)


     (setq company-idle-delay 0)
     (setq company-minimum-prefix-length 3)
     (setq company-dabbrev-downcase nil)))
