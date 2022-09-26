(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))
(eval-when-compile (require 'use-package))
(eval-and-compile
  (setq use-package-always-defer t)
  (setq use-package-always-ensure t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  )

;;  define ui setting and function
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-15"))
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(global-linum-mode t)
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; cnfonts
;; (use-package cnfonts
;;   :init (cnfonts-mode 1))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(defun open-my-gtd-file()
  (interactive)
  (find-file "~/Org/GTD.org"))
(global-set-key (kbd "<f7>") 'open-my-gtd-file)


(defun init-file()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f5>") 'init-file)
;; better default
(setq auto-save-default nil)
(fset 'yes-or-no-p 'y-or-n-p)

;; (require 'recentf)
;; (recentf-mode 1)

;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; package settings
(require 'package)
;;(require 'cl-lib)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-selected-packages '(
				  doom-modeline
				  use-package
				  company
				  undo-tree
				  yasnippet
				  yasnippet-snippets
				  smartparens
				  sly
				  lsp-mode
				  lsp-haskell
				  js2-mode
				  haskell-mode
				  all-the-icons
				  which-key
				  terminal-here
				  expand-region
				  swiper
				  web-mode
				  iedit
				  monokai-theme
				  org-roam
				  magit
				  cnfonts
				  fzf
				  bbyac
				  dashboard
				  counsel
				  ace-window
				  )) 

;; package install keybindings
(global-set-key (kbd "<f6>") 'package-install-selected-packages)


;; benchmark init

;; company mode
(use-package company
  :hook (after-init . global-company-mode)
  )

(add-hook 'sly-mrepl-mode-hook #'company-mode)

;; smartparens mode
(use-package smartparens
  :hook (after-init . smartparens-global-mode))


;; iedit-mode
(global-set-key (kbd "M-s e") 'iedit-mode)
;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; monokai theme
(load-theme 'monokai 1)

;; dashboard
(use-package dashboard
  :hook (after-init  . dashboard-setup-startup-hook))


;; counsel
(use-package counsel
  :bind ("M-x" . 'counsel-M-x)
  ("C-x C-f" . 'counsel-find-file)
  )

;; bbyac
(use-package bbyac
  :hook (after-init . bbyac-global-mode))


;; swiper
(use-package swiper
  :bind ("C-s" . 'swiper)
  )

;; acw window
(use-package ace-window
  :bind ("M-o" . 'ace-window))

;; which key
(use-package which-key
  :hook (after-init . which-key-mode))

;; terminal here
(use-package terminal-here
  :bind ("M-=" . #'terminal-here-launch))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 2)
 '(lsp-enable-indentation nil)
 '(warning-suppress-types '(((tar link)) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; org-mode
(setq org-agenda-files '("~/Org/GTD.org"))
(require 'org-tempo)
(global-set-key (kbd "C-c a") 'org-agenda)

;; sly-mode
(use-package sly
  :init (setq inferior-lisp-program "/usr/bin/sbcl"))
(add-hook 'lisp-mode-hook 'company-mode)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'lsp)

;; yasnippet-mode
(use-package yasnippet
  :hook (after-init . yas-global-mode)
  :bind ("C-c y" . 'company-yasnippet)
  )
;; all the icons
;;(when (display-graphic-p)
(use-package all-the-icons)

;; haskell-mode
(use-package lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

;; web mode
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-hook 'web-mode-hook #'lsp)

;; doom modeline
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))
