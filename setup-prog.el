;; setup cedet mode, apparently it is pretty good...
(require 'cedet)
(require 'semantic)
(global-ede-mode 1)
(add-hook 'prog-mode-hook 'semantic-mode)
(global-semantic-idle-completions-mode)

;; fic-mode for TODO etc.
(require 'fic-mode)
(add-hook 'prog-mode-hook 'fic-mode)

(provide 'setup-prog)
