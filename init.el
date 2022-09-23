;;  define ui setting and function 
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-14"))
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)


(defun init-file()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f5>") 'init-file)
;; better default
(fset 'yes-or-no-p 'y-or-n-p)
(require 'recentf)
(recentf-mode 1)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; package settings
(require 'package)
(require 'cl-lib)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-selected-packages '(
				  company
				  smartparens
				  evil
				  which-key
				  terminal-here
				  expand-region
				  swiper
				  iedit
				  monokai-theme
				  bbyac
				  dashboard
				  counsel
				  ace-window
				  )) 

;; package install keybindings
(global-set-key (kbd "<f6>") 'package-install-selected-packages)

;; company mode
(global-company-mode t)

;; smartparens mode
(smartparens-global-mode t)

;; iedit-mode
(global-set-key (kbd "M-s e") 'iedit-mode)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; monokai theme
(load-theme 'monokai 1)

;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

;; counsel
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; bbyac
(require 'bbyac)
(bbyac-global-mode 1)

;; swiper
(global-set-key (kbd "C-s") 'swiper)

;; acw window
(global-set-key (kbd "M-o") 'ace-window)

;; evil mode
(require 'evil)
(evil-mode 1)

;; which key
(require 'which-key)
(which-key-mode)

;; terminal here
(require 'terminal-here)
(global-set-key (kbd "M-=") #'terminal-here-launch)
(custom-set-variables
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 2)
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
