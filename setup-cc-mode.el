
(require 'smartparens-config)

;; add other c-type modes here
(sp-with-modes '(c++-mode c-mode java-mode)
  (sp-local-pair "(" ")")
  (sp-local-pair "{" "}")
  (sp-local-pair "<" ">"))

(provide 'setup-cc-mode)
