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
(require 'cnfonts)
(cnfonts-mode 1)
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
(require 'recentf)
(recentf-mode 1)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; package settings
(require 'package)
(require 'cl-lib)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-selected-packages '(
				  doom-modeline
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
				  evil
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

;; company mode
(global-company-mode t)
(add-hook 'sly-mrepl-mode-hook #'company-mode)
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
;;(require 'evil)
;;(evil-mode 1)

;; which key
(require 'which-key)
(which-key-mode)

;; terminal here
(require 'terminal-here)

;; terminal
(global-set-key (kbd "M-=") #'terminal-here-launch)
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
(require 'sly)
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-hook 'lisp-mode-hook 'company-mode)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'lsp)

;; yasnippet-mode
(require 'yasnippet)
(yas-global-mode 1)
(global-set-key (kbd "C-c y") 'company-yasnippet)

;; all the icons
(when (display-graphic-p)
  (require 'all-the-icons))

;; haskell-mode
(require 'lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

;; web mode
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-hook 'web-mode-hook #'lsp)

;; doom modeline
(doom-modeline-mode 1)
