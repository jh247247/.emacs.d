;; My keybindings for paredit

(require 'paredit)
(require 'dash)
(require 's)

(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(defun paredit-wrap-square-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-square))

(defun paredit-wrap-curly-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-curly))

(defun paredit-kill-region-or-backward-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (paredit-backward-kill-word)))

(add-hook 'global-mode-hook (lambda () (paredit-mode 0)))
(add-hook 'clojure-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'nrepl-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))

;; don't hijack \ please
(define-key paredit-mode-map (kbd "\\") nil)

;; making paredit work with delete-selection-mode
(put 'paredit-forward-delete 'delete-selection 'supersede)
(put 'paredit-backward-delete 'delete-selection 'supersede)
(put 'paredit-newline 'delete-selection t)


;; functions in smartparens that do not have an equivalent in paredit -
;; take a look at them
(when nil
  '(sp-beginning-of-sexp
    sp-end-of-sexp
    sp-next-sexp
    sp-previous-sexp
    sp-kill-sexp
    sp-unwrap-sexp
    sp-backward-unwrap-sexp
    sp-select-next-thing-exchange
    sp-select-next-thing
    sp-forward-symbol
    sp-backward-symbol))

(provide 'setup-paredit)
