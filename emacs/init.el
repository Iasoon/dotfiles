;; Space littering is bad
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Pls no
(setq inhibit-startup-screen t)

(require 'package)

;; Packages

(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(defun ensure-installed (&rest packages)
  (mapcar
   (lambda (package)
     (unless (package-installed-p package)
       (package-install package)))
   packages))

(ensure-installed 'helm
		  'projectile
		  'helm-projectile
		  'magit
		  'company
		  'flycheck
		  'solarized-theme)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)

;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; colours!
(load-theme 'solarized-light t)
