(provide 'init-keymaps)

;;; global

(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-\\") 'highlight-symbol-at-point)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-j") 'other-window)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-r") 'rotate-windows)
(global-set-key (kbd "M-R") 'toggle-window-split)
(global-set-key (kbd "M-f") 'split-window-right-and-move-there)
(global-set-key (kbd "M-F") 'split-window-below-and-move-there)
(global-set-key (kbd "M-m") 'ido-imenu)
(global-set-key (kbd "M-w") 'quit-window)
(global-set-key (kbd "M-W") 'only-current-buffer)
(global-set-key (kbd "M-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "<f8>") 'magit-blame-mode)
(global-set-key (kbd "<f7>") 'multi-term-dedicated-toggle)
(global-set-key (kbd "M-.") 'etags-select-find-tag)
(global-set-key (kbd "M-o") 'occur)
(global-set-key (kbd "<f3>") 'flycheck-list-errors)
(global-set-key (kbd "M-S-o") 'multi-occur)
(global-set-key (kbd "C-f") 'dired)
(global-set-key (kbd "M-v") 'evil-paste-after)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-P") 'session-jump-to-last-change)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-j") 'evil-window-next)
(global-set-key (kbd "C-SPC") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-t") 'projectile-find-file)
(global-set-key (kbd "C-p") 'switch-to-local-project)
(global-set-key (kbd "C-S-P") 'prodigy)
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "M-=") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)

;;; normal
(define-key evil-normal-state-map " m" 'evil-jump-item)
(define-key evil-normal-state-map ",," 'evil-buffer)
(define-key evil-normal-state-map "-" 'delete-other-windows)
(define-key evil-normal-state-map "b" 'ido-switch-buffer)
(define-key evil-normal-state-map "B" 'ibuffer)
(define-key evil-normal-state-map "e" 'ido-find-file)
(define-key evil-normal-state-map "E" 'ido-find-file-in-project-root)
(define-key evil-normal-state-map "\\" 'evil-repeat-find-char-reverse)
(define-key evil-normal-state-map "H" 'evil-first-non-blank)
(define-key evil-normal-state-map "Y" 'copy-to-end-of-line)
(define-key evil-normal-state-map "L" 'evil-last-non-blank)
(define-key evil-normal-state-map (kbd "<tab>") 'indent-for-tab-command)
(define-key evil-normal-state-map (kbd "<C-return>") 'new-line-in-normal-mode)


;;; esc ALWAYS quits

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'keyboard-quit)

;;; editing

(global-set-key (kbd "M-q") 'evil-quit-all)
(evil-define-key 'visual global-map
  (kbd "M-d") 'duplicate-region)

(evil-define-key 'normal global-map
  (kbd "M-<backspace>") 'kill-whole-line
  (kbd "M-d") 'duplicate-current-line)

(evil-define-key 'insert global-map
  (kbd "M-d") 'duplicate-line
  (kbd "M-<backspace>") 'kill-whole-line
  (kbd "A-<backspace>") 'backward-kill-word
  (kbd "M-J") 'evil-join
  (kbd "M-v") 'yank
  (kbd "M-S-<return>") 'evil-open-above
  (kbd "M-<return>") 'evil-open-below)

;;; ex-mode

(defun ex-mode-mapping (cmd)
  (let ((binding (car cmd))
        (fn (cdr cmd)))
    (evil-ex-define-cmd binding fn)))

(mapc 'ex-mode-mapping
      '(("!"                        . shell-command)
        ("log"                      . magit-log)
        ("[buff]ers"                . ibuffer)
        ("[br]branch"               . magit-branch-manager)
        ("bash"                     . multi-term)
        ("deft"                     . deft)
        ("reset-directory"          . reset-current-dir)
        ("log"                      . magit-file-log)
        ("gulp"                     . gulpjs-start-task)
        ("history"                  . git-timemachine)
        ("bundle"                   . bundle-install)
        ("clean"                    . clean-up-buffer-or-region)
        ("align"                    . align-regexp)
        ("[er]eval-region"          . eval-region)
        ("[eb]eval-buffer"          . eval-buffer)
        ("ack"                      . ack)
        ("ag"                       . ag-project)
        ("agl"                      . ag)
        ("agf"                      . ag-project-files)
        ("[al]ack-location"         . ack-location)
        ("gist-list"                . yagist-list)
        ("gist"                     . yagist-region-or-buffer)
        ("gistp"                    . yagist-region-or-buffer-private)
        ("sh"                       . ansi-term)
        ("mx"                       . smex)
        ("mysql"                    . sql-mysql)
        ("[gh]github"               . open-github-from-here)
        ("[de]debug-elisp"          . edebug-defun)
        ("[pr]oject"                . switch-to-local-project)
        ("p"                        . prodigy)
        ("sw"                       . swoop)
        ("swm"                      . swoop-multi)
        ("mongo"                    . inf-mongo)
        ("sql"                      . sql-mysql)
        ("delete"                   . delete-this-buffer-and-file)
        ("rename"                   . rename-this-file-and-buffer)
        ("rlog"                     . rails-log-show-development)
        ("occur"                    . occur)
        ("rubo"                     . rubocop-autocorrect-current-file)
        ("[em]acs"                  . dired-to-emacs-dir)))
