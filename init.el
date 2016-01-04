;;; Begin initialization
;; Turn off mouse interface early in startup to avoid momentary display
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; Set up package
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'req-package)
  (package-refresh-contents)
  (package-install 'req-package))

(eval-when-compile
  (require 'use-package)
  (require 'req-package))
(require 'bind-key)

;;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))
(put 'dired-find-alternate-file 'disabled nil)
