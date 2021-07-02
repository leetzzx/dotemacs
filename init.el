(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)



(require 'ob-tangle)


;; FUNCTIONS
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

(defun open-my-GTD-file()
  (interactive)
  (find-file "~/Org/GTD.org"))
(global-set-key (kbd "C-c t") 'open-my-GTD-file)

(defun init-file()
  (interactive)
  (load-file "~/.emacs.d/init.el"))


;;(delete-selection-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;leetz
					    ("ltz" "leetz")
					    ))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
