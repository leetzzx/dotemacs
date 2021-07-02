(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
(setq ring-bell-function 'ignore)
(global-linum-mode 1)
(require 'recentf)
(recentf-mode 1)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq recentf-max-menu-natively t)
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
(setq dired-dwim-target t)
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-better-defaults)
