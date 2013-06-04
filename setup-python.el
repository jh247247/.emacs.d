
;; make it so that doctrings are pretty.
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(mmm-add-classes
 '((python-rst
    :submode rst-mode
    :front "^ *[ru]?\"\"\"[^\"]*$"
    :back "^ *\"\"\""
    :include-front t
    :include-back t
    :end-not-begin t)))
(mmm-add-mode-ext-class 'python-mode nil 'python-rst)

(provide 'setup-python)
