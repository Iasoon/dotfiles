;; Space littering is bad
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Pls no
(setq inhibit-startup-screen t)

;; Git exists
(setq make-backup-files nil)

(require 'package)

;; Packages

(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq use-package-always-ensure t)

(use-package solarized-theme
  :config
  (load-theme 'solarized-light t))

(use-package helm
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (helm-mode 1))

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package magit)

(use-package company)

(use-package flycheck)

;; C programming
(use-package rtags
  :config
  (setq rtags-path (expand-file-name "~/src/rtags/bin")))

(use-package lispy
  :config
  ;; dvorak friendly bindings
  (mapc (lambda (bind) (lispy-define-key lispy-mode-map (car bind) (cdr bind)))
  	'(("h" . lispy-down)
  	  ("t" . lispy-up)
  	  ("n" . lispy-flow)
  	  ("d" . lispy-left)
	  ("s" . lispy-right)
	  ("o" . lispy-different)
	  ("H" . lispy-move-down)
	  ("T" . lispy-move-up))))

(add-hook 'emacs-lisp-mode-hook 'lispy-mode)
