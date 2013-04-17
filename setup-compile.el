(require 'compile)

;; essentially setup compile-again command
(setq compilation-last-buffer nil)
(defun compile-again (pfx)
  (interactive "p")
  (if (and (eq pfx 1)
                   compilation-last-buffer)
          (progn
                (set-buffer compilation-last-buffer)
                (revert-buffer t t))
        (call-interactively 'compile)))

(provide 'setup-compile)
