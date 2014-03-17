;;; .emacs
; John A. Rowley
; 16 March 2014

;; Add MELPA to Repository
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Editing
; Disable AutoSave & Backups
(setq auto-save-default nil
      make-backup-files nil)
; Auto Pair Parens/Braces
(electric-pair-mode t)
; Tabs - 4 Wide
(setq indent-tabs-mode t
      tab-width 4)

;; Environment
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

;; Packages
; Auto-Complete
(require 'auto-complete-config)
(ac-config-default)
; IDO Mode
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; Theming
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
; Set Line Number Background
(set-face-attribute 'linum nil :background "#1B1D1E")
