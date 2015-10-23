;;; package -- Summary
;;; Commentary:

;;; Code:

(setq package-enable-at-startup nil)
(package-initialize)

;; SML
(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin" exec-path))

;; Path
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-to-list 'load-path "~/.dotfiles/emacs.d.symlink/")

;; Theme
(load-theme 'zenburn t)

;; Turn off mouse interface
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)

;; Ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Inhibit startup message
(setq inhibit-startup-message t)

;; Fullscreen
;;(defun toggle-fullscreen ()
;;  (interactive)
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;;)
;(toggle-frame-fullscreen)
(setq ns-use-native-fullscreen nil)

;; Package
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; El-get
;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;(unless (require 'el-get nil 'noerror)
  ;(with-current-buffer
      ;(url-retrieve-synchronously
       ;"https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    ;(let (el-get-master-branch)
      ;(goto-char (point-max))
      ;(eval-print-last-sexp))))
;(el-get 'sync)

;; Jedi
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; Flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)

;; Autopair
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

