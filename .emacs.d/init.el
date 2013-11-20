(add-to-list 'load-path "~/.emacs.d/")

;; Turn off mouse interface
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(require 'color-theme)
(color-theme-initialize)
(color-theme-gnome2)