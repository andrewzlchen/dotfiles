;; Package.el ;;
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  
  (require 'use-package))

(use-package package
	     :ensure t)
;; BEHAVIOR

(use-package helm
  :bind (("M-x"     . helm-M-x)
         ("C-x C-b" . malb/helm-omni)
         ("C-x C-f" . helm-find-files))
  
  :init (progn
          (use-package helm-config)
          (use-package helm-misc)
          (use-package helm-projectile)
          (use-package helm-mode)
          (use-package helm-buffers)
          (use-package helm-files)
          (use-package helm-locate)
          (use-package helm-bookmark)
	  
          (setq helm-quick-update t
                helm-bookmark-show-location t
                helm-buffers-fuzzy-matching t
                helm-input-idle-delay 0.01)
	  
          (defun malb/helm-omni (&rest arg) 
            ;; just in case someone decides to pass an argument, helm-omni won't fail.
            (interactive)
            (helm-other-buffer
             (append ;; projectile errors out if you're not in a project 
              (if (projectile-project-p) ;; so look before you leap
                  '(helm-source-projectile-buffers-list
                    helm-c-source-buffers-list)
                '(helm-c-source-buffers-list)) ;; list of all open buffers
	      
              (if (projectile-project-p)
                  '(helm-source-projectile-recentf-list
                    helm-c-source-recentf)
                '(helm-c-source-recentf)) ;; all recent files
	      
              (if (projectile-project-p)
                  '(helm-source-projectile-files-list
                    helm-c-source-files-in-current-dir)
                '(helm-c-source-files-in-current-dir)) ;; files in current directory
	      
              '(helm-c-source-locate               ;; file anywhere
                helm-c-source-bookmarks            ;; bookmarks too
                helm-c-source-buffer-not-found     ;; ask to create a buffer otherwise
                )) "*helm-omni*"))
	  
          (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
          (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
          (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
          ))
    ;; Evil Mode
    (use-package evil-leader
      ;; needs to be before evil mode
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
	"e" 'find-file
	"b" 'switch-to-buffer
	"k" 'kill-buffer
	"b" 'list-buffers
	"s" 'save-buffer
	"c" 'comment-or-uncomment-region
	"f" 'ranger
	"h" 'helm-projectile-find-file
	"p" 'helm-projectile-switch-project
	"<tab>" 'switch-to-next-buffer
	"<ESC>" 'switch-to-prev-buffer
	"<SPC>" 'helm-M-x)
    )
    (use-package evil-visual-mark-mode
		:ensure t
		:config (evil-mode t))
    (use-package evil-opener
    :ensure t
    :config (global-evil-opener-mode t))
    (use-package evil-magit :ensure t)
    (use-package evil-matchit :ensure t)
    (use-package evil-org :ensure t)
    (use-package evil-surround :ensure t)
    (use-package evil-escape :ensure t)
    (use-package evil-nerd-commenter :ensure t)
    (use-package auto-indent-mode
    :ensure t
    :config (auto-indent-mode t))
    (use-package auto-complete
    :ensure t
    :config (auto-complete-mode t))
    (use-package flycheck
    :commands global-flycheck-mode
    :init (global-flycheck-mode)
    :config (progn
		(setq flycheck-check-syntax-automatically '(save mode-enabled))
		(setq flycheck-standard-error-navigation nil)
		;; flycheck errors on a tooltip (doesnt work on console)
		(when (display-graphic-p (selected-frame))
		(eval-after-load 'flycheck
		    '(custom-set-variables
		    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
		)))

;; USER INTERFACE
    (use-package dashboard
    :config
    (dashboard-setup-startup-hook)
    (setq dashboard-banner-logo-title "Welcome to Evil Emacs!")
    (setq dashboard-startup-banner "~/dotfiles/assets/pepe1.png") 
    )
    (use-package minimap
    :ensure t
    :config
	(minimap-mode t)
	(minimap-mode t)
    )
    (use-package all-the-icons :ensure t)
    (use-package indent-guide
      :ensure t
	:config (indent-guide-mode t))
    (global-linum-mode t) 
    (line-number-mode 1)
    (linum-mode 1)
    (setq-default
     whitespace-line-column 80
	whitespace-style '(face lines-tail))

;; LANGUAGES
    (use-package markdown-mode :ensure t)

;; PROJECT MANAGEMENT
(use-package projectile
    :ensure t
    :commands (projectile-global-mode projectile-ignored-projects)
    :init (progn
	    (projectile-global-mode)        
    :config (progn
		(setq projectile-completion-system 'helm)
		(setq projectile-switch-project-action 'helm-projectile)
		)))

(global-set-key (kbd "<f6>") 'next-error)
(global-set-key (kbd "<f2>") 'magit-status)

;; KEYBINDINGS

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(linum ((t (:inherit (shadow default) :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(linum-format (quote dynamic))
 '(menu-bar-mode nil)
 '(minimap-mode t)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (flycheck flycheck-color-mode-line flycheck-pos-tip indent-guide minimap auto-complete auto-indent-mode ranger helm-projectile projectile all-the-icons neotree evil-escape dashboard evil-leader evil-magit evil-matchit evil-nerd-commenter evil-opener evil-org evil-surround markdown-mode use-package helm evil-visual-mark-mode)))
 '(ps-line-number t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
