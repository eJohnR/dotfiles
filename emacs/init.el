;;; .Emacs
; John A. Rowley
; Tue Sep  2 22:15:39 BST 2014

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
(electric-pair-mode 1)
(show-paren-mode 1)
; Tabs - 4 Wide
(setq-default tab-width 4
			  c-basic-offset 4
			  c-default-style "linux"
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
; Evaluate Buffer / Reload init.el
(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(local-set-key (kbd "C-x E") 'eval-buffer)))
; Reduce Delay
(setq echo-keystrokes 0.1
	  use-dialog-box nil)
; Display Time
(setq display-time-24hr-format t
	  display-time t)
(display-time)

;; Packages
; Company-Mode
(add-hook 'after-init-hook 'global-company-mode)
; Rainbow Delimiter
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)
; YASnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Theming
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'base16-default t)
; Set Line Number Foreground/Background
(set-face-attribute 'linum nil :background "#202020")
(set-face-attribute 'linum nil :foreground "#444444")
; Set Mode Line Background
(set-face-background 'mode-line "#202020")
