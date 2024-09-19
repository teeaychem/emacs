;; -*- lexical-binding: t; -*-

;;; Code:

;; save custom things to separate file
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/"))

(setq package-archive-priorities
      '(("melpa-stable" . 1)
        ("melpa" . 0)
        ("gnu-devel" . -1)))

;; load custom.el before doing anything else with packages as it contains a useful list
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(package-initialize)


(when (not (file-directory-p (expand-file-name "elpa" user-emacs-directory)))
  (package-refresh-contents)
  (package-install-selected-packages))

(setq use-package-verbose t)
(setq package-enable-at-startup nil) ;; don't make installed packages available before loading the init.el file.
(setq use-package-always-ensure t)



(setq vc-follow-symlinks t) ;; always open the file a symlink points to




;; Load config.org - my Emacs config
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

(require 'server)
(unless (server-running-p) (server-start)) ; start emacs in server mode so skim can talk to it

;;; init.el ends here
