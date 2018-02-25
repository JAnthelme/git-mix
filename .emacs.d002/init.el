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

; code folding
(add-hook 'c-mode-common-hook 'hs-minor-mode) ; hs-hide-all, hs-show-all, hs-toggle-hiding, hs-hide-level

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


;; ------------
;; appearance
;; ------------

;; check this out : https://emacs.stackexchange.com/questions/20791/how-to-define-color-for-part-of-a-comment
;; color scheme
;; https://coolors.co/752400-a23901-c85302-f68801-feb001
;; https://github.com/ongaeshi/.emacs.d/blob/master/site-lisp/color-setting.el
;; https://stackoverflow.com/questions/63950/how-to-make-emacs-terminal-colors-the-same-as-emacs-gui-colors
;; https://stackoverflow.com/questions/26120490/why-is-emacs-syntax-highlighting-in-gnome-terminal-affected-by-terminal-colour-t#27952390
;; https://stackoverflow.com/questions/19965325/gnome-terminal-or-vte-sets-term-to-xterm-rather-than-xterm-256color
;; https://www.w3schools.com/colors/tryit.asp?filename=trycolors_rgbvalues

; generic
(set-foreground-color "#FEC328")
(set-background-color "#1D1B16")
(set-face-background 'cursor "#D3CFC1")
(set-face-attribute 'region nil :background "#AD8A38")

;font-lock
(set-face-foreground 'font-lock-comment-face "white")
(set-face-foreground 'font-lock-comment-delimiter-face "#FFFAE6")
(set-face-foreground 'font-lock-function-name-face "#FEF534")
(set-face-background 'font-lock-function-name-face "#2C2707") 

(set-face-foreground 'font-lock-preprocessor-face "#FFB366")
(set-face-foreground 'font-lock-constant-face "#FFFAE6")
(set-face-foreground 'font-lock-keyword-face "#FFAC33") ; #FF8000 "#E8E430") 
(set-face-foreground 'font-lock-string-face "#FFFAE6") 
(set-face-foreground 'font-lock-type-face "#D5600F") ; "#C85302")
(set-face-foreground 'font-lock-variable-name-face "#E8DF30") ; E8E430 "#FF8000") 

; mode-line
(set-face-foreground 'mode-line "white")
(set-face-background 'mode-line "#660000")
(set-face-background 'mode-line-inactive "light blue")

;mini-buffer
(set-face-foreground 'minibuffer-prompt "yellow")
(set-face-background 'minibuffer-prompt "grey")



;; ------------
;; other
;; ------------

