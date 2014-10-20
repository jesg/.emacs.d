(provide 'init-cucumber)

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; define custom goto test step functions
(eval-after-load "feature-mode"
  '(progn
     (defun feature-open-step-definition (window-action)
       (feature-find-step-definition
        (lambda (project-root file line-no)
          (progn
            (ring-insert find-tag-marker-ring (point-marker))
            (funcall window-action)
            (find-file file)
            (goto-char (point-min))
            (forward-line (1- line-no))
            (other-window -1)))))

     (defun feature-open-step-definition-right ()
       "Open step definition to the right of the feature. Requires ruby."
       (interactive)
       (feature-open-step-definition 'split-window-right))

     (defun feature-open-step-definition-below ()
       "Open step definition to the below of the feature. Requires ruby."
       (interactive)
       (feature-open-step-definition 'split-window-below))

     (defun feature-goto-step-definition-and-move-there (window-action)
       (feature-find-step-definition
        (lambda (project-root file line-no)
          (progn
            (ring-insert find-tag-marker-ring (point-marker))
            (funcall window-action)
            (find-file file)
            (goto-char (point-min))
            (forward-line (1- line-no))))))

     (defun feature-goto-step-definition-right-and-move-there ()
       "Open step definition to the right of the feature and move there. Requires ruby."
       (interactive)
       (feature-goto-step-definition-and-move-there 'split-window-right))

     (defun feature-goto-step-definition-below-and-move-there ()
       "Open step definition below the feature and move there. Require ruby."
       (interactive)
       (feature-goto-step-definition-and-move-there 'split-window-below))

     (evil-define-key 'normal feature-mode-map
       (kbd "]C-d")    'feature-goto-step-definition
       (kbd "C-w d")   'feature-goto-step-definition-below-and-move-there
       (kbd "C-w C-d") 'feature-goto-step-definition-right-and-move-there
       "]d"            'feature-open-step-definition-right
       )))
