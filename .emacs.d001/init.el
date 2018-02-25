;;; emacs config based on
;;;      https://jamiecollinson.com/blog/my-emacs-config/
;;;      http://tuhdo.github.io/c-ide.html#orgheadline11


;; ------------
;; package.el and use-package
;; ------------

(require 'package)
; MELPA repository
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))






;; ------------
;; preferences
;; ------------

; do not dispaly splash screen
(setq inhibit-startup-screen t)
; shorter yes or no
(defalias 'yes-or-no-p 'y-or-n-p)


;; ------------
;; appearance
;; ------------


;; ------------
;; code
;; ------------

; use-package-chords
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))

; auto-completion
(use-package company
    :ensure t
    :init
    (require 'cc-mode)
    :diminish
    :config
    (add-hook 'after-init-hook 'global-company-mode)
    (define-key c-mode-map  [(tab)] 'company-complete)
    (define-key c++-mode-map  [(tab)] 'company-complete))

; snippets
(use-package yasnippet
      :ensure t
      :diminish yas-minor-mode
      :config
      (add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippet-snippets")
      (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
      (yas-global-mode))
      ;(global-set-key (kbd "M-/") 'company-yasnippet))

(use-package yasnippet-snippets
      :ensure t)

; crux - smart beginning of line
(use-package crux
    :ensure t
    :bind (("<home>" . crux-move-beginning-of-line)))

; speedbar
; sr-speedbar-toggle
(use-package sr-speedbar
      :ensure t
      :chords
      ("ff" . sr-speedbar-toggle) 
      :config
      (setq sr-speedbar-right-side nil))

;; ------------
;; keybindings
;; ------------

(global-set-key (kbd "C-z") 'undo)                             ; C-z

(global-set-key (kbd "<C-prior>") 'next-buffer)                ; C-Page Down
(global-set-key (kbd "<C-next>") 'previous-buffer)             ; C-Page Up
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)         ; C-Home
(global-set-key (kbd "C-<end>") 'end-of-buffer) 

(global-set-key (kbd "<M-prior>") 'other-window)               ; C-Page Up
(global-set-key (kbd "<M-next>") 'previous-multiframe-window)  ; C-Page Down

(global-set-key (kbd "<f6>") 'highlight-regexp)                ; F6
(global-set-key (kbd "S-<f6>") 'unhighlight-regexp)            ; S-F6
(global-set-key (kbd "C-<f6>") 'linum-mode)                    ; C-F6

(global-set-key (kbd "<f8>") 'enlarge-window-horizontally)     ; F8
(global-set-key (kbd "S-<f8>") 'shrink-window-horizontally)    ; S-F8



; code folding
(add-hook 'c-mode-common-hook 'hs-minor-mode) ; hs-hide-all, hs-show-all, hs-toggle-hiding, hs-hide-level
