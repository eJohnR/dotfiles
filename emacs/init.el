;;; .Emacs
; John A. Rowley
; Thu Mar 16 21:58:06 GMT 2014

;; User Details
(setq user-full-name    "John A. Rowley"
	  user-mail-address "John.A.Rowley@Googlemail.com")

;; Extend Default Repositories
(require 'package)
(package-initialize)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
			 '("marmalade" . "http://marmalade-repo.org/packages"))

;; Editing
; Disable AutoSave & Backups
(setq auto-save-default nil
	  make-backup-files nil)
; Auto Pair Parens/Braces
(show-paren-mode 1)
; Tabs - 4 Wide
(setq-default tab-width 4
			  c-basic-offset tab-width
			  tab-stop-list (list 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)
			  indent-tabs-mode t)

;; Environment
;Display Column Number
(column-number-mode 1)
; Display Line Numbers
(global-linum-mode t)
(setq linum-format "%4d ")
; Disable Splash Screen
(setq inhibit-startup-screen t
	  initial-scratch-message nil)
; Y or N
(defalias 'yes-or-no-p 'y-or-n-p)
; Resize the Window
(setq initial-frame-alist '((width . 88)
							(height . 53)))
(setq default-frame-alist '((width . 88)
							(height . 53)))
; Hide the Fluff
(fringe-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Faces
(global-font-lock-mode 1)
(set-default-font "Inconsolata-13")

;; Misc
; Reduce Delay
(setq echo-keystrokes 0.1
	  use-dialog-box nil)
; Display Time
(setq display-time-24hr-format t
	  display-time t)
(display-time)

;; Packages
; Auto-Complete
(require 'auto-complete-config)
(ac-config-default)
; Smart-Parens
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
; YASnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Theming
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
; Set Line Number Background
(set-face-attribute 'linum nil :background "#1B1D1E")
