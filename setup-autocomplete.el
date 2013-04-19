(require 'auto-complete-config)
(add-to-list 'load-path "~/.emacs.d/auto-complete")

;; make things slightly nicer to edit...
(add-hook 'prog-mode-hook '(lambda ()
                             (setq ac-sources (append '(ac-source-semantic) ac-sources))
                             (local-set-key (kbd "RET") 'newline-and-indent)
                             (semantic-mode t)))

(add-to-list 'ac-dictionary-directories (expand-file-name
                                         "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict"))
(setq ac-comphist-file (expand-file-name
                        "~/.emacs.d/auto-complete/dict"))
(ac-config-default)
(define-key ac-complete-mode-map [tab] 'ac-expand)
(add-hook 'prog-mode-hook 'auto-complete-mode)

(provide 'setup-autocomplete)
