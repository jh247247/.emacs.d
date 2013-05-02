(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c\C-o")

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;;(load "auctex.el" nil t t) ; YEAH, AUCTEX!
;;(load "preview-latex.el" nil t t)
(setq-default TeX-master nil) ; Query for master file.

(provide 'setup-latex)
