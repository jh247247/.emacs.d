

(setq font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;;(set-face-background 'region "#464740")

;; Highlight current line
(global-hl-line-mode 0)

;; Customize background color of lighlighted line
;; (set-face-background 'hl-line "#222222")

;; Highlight in yasnippet
(set-face-background 'yas/field-highlight-face "#333399")

(set-face-foreground 'font-lock-warning-face "#ff6666")

;; org-mode colors
(setq org-todo-keyword-faces
      '(
        ("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))
        ))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Make zooming affect frame instead of buffers
(require 'zoom-frm)

;; go back to old, comfortable theme...
(require 'color-theme)
(color-theme-initialize)
(color-theme-billw)

;; add syntax highlighting for special tags (TODO, FIXME, KLUDGE)
(require 'fic-mode)
(add-hook 'prog-mode-hook 'turn-on-fic-mode)

;; highlight uneeded whitespace and columns past char 80
;; 70 is better for small laptop screens...
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

(provide 'appearance)
