(provide 'init-term)

'(term-default-fg-color ((t (:inherit term-color-white))))
'(term-default-bg-color ((t (:inherit term-color-black))))

;; ansi-term colors
(setq ansi-term-color-vector
      [term term-color-black term-color-red term-color-green term-color-yellow
            term-color-blue term-color-magenta term-color-cyan term-color-white])



(eval-after-load "term"
  '(progn
     (require 'multi-term)

     (define-key term-raw-map (kbd "M-x") 'smex)
     (define-key term-raw-map (kbd "M-j") 'evil-window-next)
     (define-key term-raw-map (kbd "C-p") 'switch-to-local-project)
     (define-key term-raw-map (kbd "C-S-P") 'prodigy)
     (evil-define-key 'insert term-raw-map (kbd "M-v") 'term-paste)))

(setq multi-term-program "/bin/bash")

(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))

(defun toggle-term-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))
