;ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.appln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Brendan Kamp"
      user-mail-address "brendankamp757@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/repos/spazzy/dotfiles/org-files/")
(after! org
  (setq org-agenda-files
        '("~/repos/spazzy/dotfiles/org-files/")))
(defun zz/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))
(zz/add-file-keybinding "C-c z a" "~/repos/spazzy/dotfiles/org-files/todo.org" "todo.org")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; -- Neotree --
(use-package neotree :ensure t
  :init
  (setq neo-window-fixed-size nil
	neo-theme (if (display-graphic-p) 'icons 'arrow)
	neo-show-updir-line nil
	neo-modern-sidebar t
	neo-auto-indent-point t
	neo-cwd-line-style 'button)
  :config
  (add-to-list
   'window-size-change-functions
   (lambda (frame)
     (let ((neo-window (neo-global--get-window)))
       (unless (null neo-window)
         (setq neo-window-width (window-width neo-window))))))

  (defun neotree-project-dir-toggle ()
    "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
    (interactive)
    (let ((project-dir
           (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
             (projectile-project-root)
             ;;(ffip-project-root)
             ))
          (file-name (buffer-file-name))
          (neo-smart-open t))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
	(progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-find file-name))))))

  :bind
  (("C-x t" . neotree-project-dir-toggle)))

;; -- Magit --
(use-package magit :ensure t
  :init
  (setq
   magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1
   magit-diff-refine-hunk t
   magit-popup-use-prefix-argument 'default
   magit-last-seen-setup-instructions "1.4.0"
   magit-log-margin '(t age-abbreviated magit-log-margin-width :author 15))
  (when (not window-system)
    (setq magit-section-visibility-indicator '("..." . t)))
  :bind
  (("C-x g" . magit-status)))

;; -- Projectile --
(use-package projectile
  :ensure t
  :bind
  ("C-x a" . projectile-run-eshell)

  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-add-known-project "~/repos/container-solutions")
  (projectile-add-known-project "~/repos/spazzy")
  (projectile-global-mode))

;; -- Python --
(use-package python
  :ensure t
  :config
  (setq doom-modeline-python-executable "python3")
  (setq python-shell-interpreter "python3")
  (setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
  (setq flycheck-python-pycompile-executable "python3"
        flycheck-python-pylint-executable "python3"
        flycheck-python-flake8-executable "python3"))

;; -- Golang --
(use-package go
  :ensure t)

;; -- Shell --
(use-package flymake-shellcheck
  :commands flymake-shellcheck-load
  :init
  (add-hook 'sh-mode-hook 'flymake-shellcheck-load))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

