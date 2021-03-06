;;; init

(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))


(mapc 'require '(init-bootstrap
                 init-evil
                 init-defuns
                 init-appearance

                 init-ido
                 init-completion
                 init-projectile
                 init-git
                 init-expand-region
                 init-parens
                 init-modeline
                 init-markdown
                 init-flycheck
                 init-ruby
                 init-multiple-cursors
                 init-volatile-highlights
                 init-snippets
                 init-anzu
                 init-dired
                 init-term
                 init-peepopen
                 init-shell
                 init-cucumber
                 init-lua
                 init-mustache
                 init-prolog

                 init-keymaps
                 init-settings))

(let ((secret-path (expand-file-name "~/Dropbox/secrets.el")))
  (when (file-exists-p secret-path)
    (load-file secret-path)))

(require 'server)
(unless (server-running-p)
  (server-start))
(setq custom-file "~/.emacs.d/init/init-custom.el")
(load custom-file)
