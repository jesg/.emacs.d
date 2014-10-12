(provide 'init-appearance)
(require 'dash)

;; only turn off menus if not osx
(if (not (eq system-type 'darwin))
    (menu-bar-mode -1))


(line-number-at-pos)

(add-hook 'after-change-major-mode-hook
          (lambda ()
            (when (and
                   (not (eq major-mode 'Custom-mode))
                   (not (eq major-mode 'shell-mode))
                   (not (eq major-mode 'emacs-pager-mode))
                   (not (eq major-mode 'term-mode))
                   (not (eq major-mode 'eshell-mode))
                   (not (eq major-mode 'ibuffer-mode))
                   (not (eq major-mode 'rspec-compilation-mode))
                   (not (eq major-mode 'prodigy-mode)))
              (setq show-trailing-whitespace t))))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(require 'highlight-cl)
(add-hook 'emacs-lisp-mode-hook 'highlight-cl-add-font-lock-keywords)

(require 'column-enforce-mode)
(defvar *dont-column-enforce* '(shell-mode prodigy-mode term-mode eshell-mode emacs-pager-mode))

(add-hook 'after-change-major-mode-hook
          '(lambda ()
             (unless (-contains? *dont-column-enforce* major-mode) (100-column-rule))))

(load-theme 'solarized-light t)
