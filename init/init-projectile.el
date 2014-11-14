(provide 'init-projectile)

(projectile-global-mode)

(global-set-key (kbd "M-W") 'projectile-kill-buffers)
(global-set-key (kbd "<f5>") 'projectile-regenerate-tags)
