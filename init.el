;; recompile directory because reasons...
;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)


;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))


;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'exec-path-from-shell melpa)
   (cons 'magit melpa)
   (cons 'move-text melpa)
   (cons 'gist melpa)
   (cons 'htmlize melpa)
   (cons 'visual-regexp-steroids melpa)
   (cons 'smartparens melpa)
   (cons 'elisp-slime-nav melpa)
   (cons 'slime-js marmalade)
   (cons 'git-commit-mode melpa)
   (cons 'gitconfig-mode melpa)
   (cons 'gitignore-mode melpa)
   (cons 'clojure-mode melpa)
   (cons 'nrepl melpa)
   (cons 'auto-complete melpa)
   (cons 'mmm-mode melpa)
   (cons 'color-theme melpa)
   (cons 'fic-mode melpa)
   (cons 'rainbow-delimiters melpa)
   (cons 'outline-magic melpa)
   (cons 'jedi melpa)))

(when (not package-archive-contents) (package-refresh-contents))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Setup environment variables from the user's shell.
(when is-mac (exec-path-from-shell-initialize))

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'org '(require 'setup-org))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'grep '(require 'setup-rgrep))
(eval-after-load 'shell '(require 'setup-shell))
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-perspective)
(require 'setup-ffip)
(require 'setup-compile)
(require 'setup-autocomplete)
(require 'setup-cc-mode)
(require 'setup-asm-mips)
(require 'setup-python)
(require 'setup-prog)


;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))
(eval-after-load 'latex-mode '(require 'setup-latex))

;; Load slime-js when asked for
(autoload 'slime-js-jack-in-browser "setup-slime-js" nil t)
(autoload 'slime-js-jack-in-node "setup-slime-js" nil t)

;; Map files to modes
(require 'mode-mappings)

;; move-text
(require 'move-text)

;; Visual regexp
(require 'visual-regexp-steroids)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

;; Tern.js
(add-to-list 'load-path (expand-file-name "tern/emacs" site-lisp-dir))
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'expand-region)
(require 'mark-more-like-this)
(require 'inline-string-rectangle)
(require 'multiple-cursors)
(require 'delsel)
(require 'jump-char)
(require 'eproject)
(require 'wgrep)
(require 'smart-forward)
(require 'change-inner)
(require 'multifiles)

;; Fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

;; Setup key bindings
(require 'key-bindings)

;; Misc
(require 'project-archetypes)
(require 'appearance)
(require 'my-misc)
(when is-mac (require 'mac))

;; Diminish modeline clutter
(require 'diminish)
(diminish 'yas/minor-mode)
(diminish 'eldoc-mode)
(diminish 'whitespace-mode)
(diminish 'fic-mode)
(diminish 'auto-complete-mode)

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))
(eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

;; Email, baby
(require 'setup-mu4e)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Start an edit server because I want to.
(require 'edit-server)
(edit-server-start)
