(setq org-agenda-files '("~/Org"))
(setq org-tag-alist '(("@reviewed" . ?r) ("@learned" . ?l)))
(global-set-key (kbd "C-c a") 'org-agenda)
(provide 'init-org)
