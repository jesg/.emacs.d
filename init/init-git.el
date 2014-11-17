(provide 'init-git)

;;(setq magit-emacsclient-executable "/usr/local/bin/emacsclient")

(global-set-key (kbd "<f1>") 'magit-status)
(define-key evil-normal-state-map (kbd "<f4>") 'magit-checkout)
(global-diff-hl-mode +1)

(require 'open-github-from-here)
(setq open-github-from-here:command (expand-file-name "~/.emacs.d/make-github-url-from-file"))
(require 'evil)
(push 'git-commit-mode evil-emacs-state-modes)
