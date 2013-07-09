(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-t*hrough nil :overline nil :underline nil :slant normal :weight normal :width normal :height 105))))
 '(diff-refine-change ((t (:background "midnight blue"))) t)
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#111111"))))
 '(js2-function-param-face ((t (:foreground "LightGoldenrod"))) t)
 '(mmm-code-submode-face ((t (:background "DimGray"))))
 '(mmm-default-submode-face ((t nil)))
 '(mmm-delimiter-face ((t (:weight bold))) t)
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)) t)
 '(rainbow-delimiters-depth-1-face ((t (:foreground "SteelBlue1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "SkyBlue1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "LightSkyBlue1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "aquamarine1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "SeaGreen1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "khaki1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "goldenrod1"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "tan1"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "chocolate1"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))
 '(show-paren-match ((nil (:background "#333399"))))
 '(show-paren-mismatch ((((class color)) (:background "red")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(ido-use-filename-at-point nil)
 '(mmm-submode-decoration-level 1)
 '(safe-local-variable-values
   (quote
    ((eval font-lock-add-keywords nil
           (quote
            (("defexamples\\|def-example-group\\| => "
              (0
               (quote font-lock-keyword-face))))))
     (eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (emacs-lisp-mode))
     (eval font-lock-add-keywords nil
           (quote
            (("defexamples\\| => "
              (0
               (quote font-lock-keyword-face))))))
     (encoding . utf-8)))))
