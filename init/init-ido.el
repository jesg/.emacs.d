(provide 'init-ido)

(quelpa 'ido-vertical-mode)
(quelpa 'ido-hacks)
(quelpa 'flx-ido)
(quelpa 'smex)

(ido-vertical-mode 1)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

;;; flx
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(setq flx-ido-threshhold 12000)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
;; set gc threshold to 20mb
(setq gc-cons-threshold 20000000)
