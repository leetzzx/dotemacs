(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
(require 'cl-lib)
;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      async
		      request
		      monokai-theme
		      company
		      company-web
		      company-php
		      company-c-headers
		      company-ctags
		      company-irony
		      yasnippet
		      yasnippet-snippets
		      ivy-yasnippet
		      ;; --- Better Editor ---
		      markdown-mode
		      youdao-dictionary 
		      popwin
		      magit
		      swiper
		      counsel
		      iedit
		      avy-flycheck
		      smartparens
		      expand-region
		      ;; --- Major Mode ---
		      web-mode
		      js2-refactor
		      js2-mode
		      php-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell 
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (cl-loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (cl-return nil)
	   finally (cl-return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 2)
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (adwaita)))
 '(package-selected-packages (quote (company))))

(setq org-agenda-files '("~/Org"))

(smartparens-global-mode t)
(require 'nodejs-repl)
(global-company-mode t)
'(company-idle-delay 0.08)
'(company-minimum-prefix-length 1)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(require 'popwin)
(popwin-mode t)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       
       auto-mode-alist))


(load-theme 'monokai 1)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(add-hook 'php-mode-hook
	  '(lambda ()
	     (require 'company-php)
	     (company-mode t)
	     (add-to-list 'company-backends 'company-ac-php-backend)))

(require 'expand-region)
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-web-slim)

;; c completion
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-clang)
(add-to-list 'company-backends 'company-etags)
(require 'company-ctags)
(with-eval-after-load 'company
  (company-ctags-auto-setup))
;;(add-to-list 'company-backends 'company-irony)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/company-english-helper"))

(require 'company-english-helper)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; avy-flycheck
(global-flycheck-mode)


(provide 'init-packages)


