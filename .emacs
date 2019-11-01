(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("da509d0e78ce656776a5442daa1729c329869b4b36938f0773275557fb8e3d0e" "b1d5aefcd9e4f3684337a5ad52b026e2ac3e6d850aee3b1be99fb4fbd8e6eaac" "f3361aa4438d1ee8e6e81082d72fe032f3ae1f11a0b40fc0da85ff6a10d2c63e" "5701b47f802d812cd1dbfae691e0ffee76f95a96b864da084950e16492cb303d" "ff358431f7fab69bec96869c702de0bc336cd275b0cb514f9d8fa5b514af43a6" "f3e40de3cb852915720f3cb28023208e4c9bd8eb45508596d9aa915695358f37" "f2fa9b17daf4af1b4c3927e552c795d0218dbd9bd94d79601663ebf97a1b6dfe" "3386120d40093812a450188b5041099f60998a5e07d5e898d8d7e80d3aaaae78" "a715475bfad76bd086a177635a1f7aee9b5e157f6d00e428722f5f869371b853" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "35f3a80494478974c4c698bdf502d8e4c7d060fe489ebc73a2bcf03e6af7807d" "48441785d77807dce4e71b065f17504fbdfb6cbcd475523d20da4f1a14fbddac" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "34e7163479ef3669943b3b9b1fabe639d6e0a0453e0de79cea2c52cb520d3bc4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "357d5abe6f693f2875bb3113f5c031b7031f21717e8078f90d9d9bc3a14bcbd8" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" default)))
 '(delete-selection-mode 1)
 '(eol-mnemonic-dos "(DOS)")
 '(eol-mnemonic-mac "(Mac)")
 '(eol-mnemonic-undecided ":(Undecided)")
 '(eol-mnemonic-unix "(Unix)")
 '(inhibit-startup-screen t)
 '(line-spacing 1)
 '(ns-pop-up-frames nil)
 '(org-agenda-files
   (quote
    ("/Users/kwpeters/Dropbox/home/data/todo.org" "/Users/kwpeters/Dropbox/home/data/home.org" "/Users/kwpeters/Dropbox/home/data/development-ideas.org")))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (fancy-narrow zencoding-mode zenburn-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tron-theme toxi-theme tango-2-theme soothe-theme solarized-theme sea-before-storm-theme reverse-theme request qsimpleq-theme naquadah-theme monokai-theme molokai-theme markdown-mode+ late-night-theme js2-refactor ir-black-theme inkpot-theme indent-guide gruber-darker-theme grandshell-theme github-theme gh fiplr expand-region exec-path-from-shell evil-paredit evil-numbers evil-nerd-commenter evil-indent-textobject espresso-theme emmet-mode django-theme deep-thought-theme cyberpunk-theme ace-jump-mode)))
 '(ps-line-number t)
 '(set-mark-command-repeat-pop t)
 '(show-trailing-whitespace t)
 '(speedbar-show-unknown-files t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;; A function that will save all buffers
(defun save-all ()
    (interactive)
    (save-some-buffers t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Package Management
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (>= emacs-major-version 24)
  (require 'package)

  ; List the packages you want.
  (setq package-list '(ace-jump-mode cyberpunk-theme
                       deep-thought-theme django-theme emmet-mode espresso-theme
                       evil-indent-textobject evil-nerd-commenter evil-numbers
                       evil-paredit evil exec-path-from-shell expand-region
                       gh github-theme grandshell-theme
                       gruber-darker-theme inkpot-theme ir-black-theme js2-refactor
                       dash js2-mode late-night-theme logito markdown-mode+
                       markdown-mode molokai-theme monokai-theme multiple-cursors
                       naquadah-theme paredit pcache qsimpleq-theme request
                       reverse-theme s sea-before-storm-theme solarized-theme
                       soothe-theme tango-2-theme toxi-theme tron-theme twilight-anti-bright-theme
                       twilight-bright-theme twilight-theme undo-tree yasnippet
                       zenburn-theme zencoding-mode indent-guide fiplr))

  ; List the repositories containing them.
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

  ; activate all the packages (in particular autoloads)
  (package-initialize)

  ; fetch the list of packages available
  (when (not package-archive-contents)
    (package-refresh-contents))

  ; install the missing packages
  (dolist (package package-list)
    (when (not (package-installed-p package))
      (package-install package)))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Path Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq dropbox-folder (file-name-as-directory (getenv "CLOUDHOME")))
;;(add-to-list 'load-path "~/.emacs.d/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Start the server so that this instance can be used to open other files using
;; emacsclient.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "server")
(unless (server-running-p) (server-start))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Window Geometry
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq default-frame-alist
     '((top . 0) (left . 200)
       (width . 95) (height . 67)
       )
     )

(setq initial-frame-alist
     '((top . 0) (left . 0)
       (width . 95) (height . 67)
       )
     )

;; Tabs should always be 4 spaces.
(setq-default tab-width 4)
;; Tabs should always be expanded into space characters.
(setq-default indent-tabs-mode nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Turn off show-trailing-whitespace when in shell-mode.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mapc (lambda (hook)
        (add-hook hook (lambda ()
                         (setq show-trailing-whitespace nil))))
      '(
        shell-mode-hook
        eshell-mode-hook
        artist-mode-hook
        Buffer-menu-mode-hook
        )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; exec-path-from-shell
;;
;; A GNU Emacs library to setup environment variables from the user's shell.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PYTHONPATH")
  (exec-path-from-shell-copy-env "CLOUDHOME")
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Backup File Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq
;;    backup-by-copying t      ; don't clobber symlinks
;;    backup-directory-alist
;;     '(("." . "~/.saves"))    ; don't litter my fs tree
;;    delete-old-versions t
;;    kept-new-versions 6
;;    kept-old-versions 2
;;    version-control t)        ; use versioned backups

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set the default font
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(set-default-font "-outline-DejaVu Sans Mono-normal-r-normal-normal-11-82-96-96-c-*-iso8859-1")
;;(set-default-font "-outline-Consolas-normal-r-normal-normal-11-82-96-96-c-*-iso8859-1")
;;(set-default-font "-apple-Consolas-medium-normal-normal-*-11-*-*-*-m-0-iso10646-1")
;;(set-face-attribute 'default nil :font "-apple-Consolas-medium-normal-normal-*-11-*-*-*-m-0-iso10646-1")

;; The following line will set the font for all new frames.  I added this so
;; that speedbar will not display in its larger default font.
;;(add-to-list 'default-frame-alist '(font . "-apple-Consolas-medium-normal-normal-*-11-*-*-*-m-0-iso10646-1"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Save buffer hooks
;;
;; The following hooks delete trailing whitespace from lines when
;; saving files
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'js2-mode-hook      (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'sgml-mode-hook     (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'c-mode-hook        (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'c++-mode-hook      (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'text-mode-hook     (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; show-paren-mode
;;
;; This mode highlights the matching opening and closing character types.
;; This line turns it on all the time.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Zen Coding (Emmett) Mode
;;
;; This is a mode that allows CSS-like syntax when composing HTML documents.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;;
;; C-j to expand
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; HTML Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; expand-region
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; A function that provides a negative prefix to er/expand-region.
(fset 'kwp-contract-region
   [?\M-- ?\M-x ?e ?r ?/ ?e ?x ?p ?a ?n ?d ?- ?r ?e ?g tab return])

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'kwp-contract-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ace-jump-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The following keybinding is the default for ace-jump-mode, but I
;; don't like it.
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(define-key global-map (kbd "C-; w") 'ace-jump-mode)
(define-key global-map (kbd "C-; c") 'ace-jump-char-mode)
(define-key global-map (kbd "C-; l") 'ace-jump-line-mode)

;; Needed for ace-jump-mode
;; http://stackoverflow.com/questions/10105123/eval-when-compile-not-being-honored
(require 'cl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Evil mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'evil)


(global-set-key (kbd "C-*") 'evil-search-symbol-forward)
(global-set-key (kbd "C-#") 'evil-search-symbol-backward)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; multiple-cursors
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; point-undo
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'point-undo)
;; The following keybindings are the ones recommended by point-undo web page:
;;(define-key global-map [f5] 'point-undo)
;;(define-key global-map [f6] 'point-redo)
;;(global-set-key (kbd "C-<kp-4>") 'point-undo)
;;(global-set-key (kbd "C-<kp-6>") 'point-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-mode settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-ca" 'org-agenda)
;;(global-font-lock-mode 1)
(setq org-agendas-folder (file-name-as-directory (concat dropbox-folder "data")))
(setq org-agenda-files (list
                        (concat org-agendas-folder "todo.org")
                        (concat org-agendas-folder "home.org")
                        (concat org-agendas-folder "development-ideas.org")
                       )
      )

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (js . t))
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; company-mode (complete anything)
;;
;; Text completion framework for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable company-mode in all buffers
;; (add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; js2-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook (lambda () (set-fill-column 79)))

;; js2-refactor configuration
(require 'js2-refactor)
;; js2-refactor keybindings
;; eg. extract function with `C-c C-m ef`.
(js2r-add-keybindings-with-prefix "C-c C-m")

;; (add-hook 'js2-mode-hook (lambda () (company-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (linum-mode t)))
(add-hook 'js2-mode-hook (lambda () (highlight-symbol-mode t)))
(add-hook 'js2-mode-hook (lambda () (electric-pair-mode t)))
(add-hook 'js2-mode-hook (lambda () (js2-refactor-mode t)))
(add-hook 'focus-out-hook 'save-all)

(global-set-key (kbd "C-; h") 'highlight-symbol-at-point)
;; smartscan
;; M-n  Moves to next occurrence of identifier under point
;; M-p  Moves to previous occurence of identifier under point
(add-hook 'js2-mode-hook (lambda () (smartscan-mode 1)))


;;(eval-after-load 'tern
;;  '(progn
;;     (require 'tern-auto-complete)
;;     (tern-ac-setup)))

;; (eval-after-load 'company
;;    '(add-to-list 'company-backends 'company-tern))


;; (add-hook 'company-mode-hook
;;           (lambda () (local-set-key (kbd "C-.") 'company-complete)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Tern Mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'tern-mode-hook (lambda ()
    (message "Configuring tern-mode")
    (setq tern-command (append tern-command '("--no-port-file"))))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; JS REPL
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; just invoke: nodejs-mode


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; typescript-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load "TypeScript")
;;(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Visual line mode
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Visual-Line-Mode.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn on fringe indicators wherever lines are wrapped.
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; yasnippet
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq my-snippets-folder (file-name-as-directory (concat dropbox-folder "appdata/emacs/kwp-yasnippets/my-snippets")))

(setq yas-snippet-dirs (list
                        my-snippets-folder ;; personal snippets
                        ))

(add-hook 'sgml-mode-hook
          '(lambda ()
             (yas-minor-mode)
             (yas-reload-all)
             )
          )

(add-hook 'js2-mode-hook
          '(lambda ()
             (yas-minor-mode)
             (yas-reload-all)
             )
          )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; indent-guide
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'indent-guide)
(indent-guide-global-mode)
;;(set-face-foreground 'indent-guide-face "#c3c3c3")
(set-face-foreground 'indent-guide-face "#E3E3E3")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; hl-line-mode
;;
;; Highlights the current line.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-hl-line-mode 1)

;; To customize the background color
;;(set-face-background hl-line-face "#1f201c")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Add to the custom themes load paths
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq my-themes-folder (file-name-as-directory (concat dropbox-folder "appdata/emacs/themes")))
(setq custom-theme-load-path (cons my-themes-folder custom-theme-load-path))
(setq custom-theme-directory my-themes-folder)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Preferred color theme
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load-theme 'monokai t)
(load-theme 'kwp t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Setup postscript fonts.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ps-build-face-reference t)
(setq ps-italic-faces '(font-lock-comment-face
                       font-lock-string-face
                       font-lock-variable-name-face))
(setq ps-bold-faces '(font-lock-keyword-face
                     font-lock-type-face
                     font-lock-function-name-face
                     font-lock-builtin-face
                     font-lock-variable-name-face))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python Stuff
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [M-/]       'dabbrev-expand)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ido mode
;;
;; Makes iswitchb mode obsolete
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make buffer switch command auto suggestions, also for find-file command
(ido-mode 1)

;; make ido display choices vertically
(setq ido-separator "\n")

;; display any item that contains the chars you typed
(setq ido-enable-flex-matching t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Fiplr keybindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Finds a file within the current project.
;; C-c f   fiplr-find-file
(global-set-key (kbd "C-c f") 'fiplr-find-file)

(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "dist" "cordova" "artifacts"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General Key Bindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; An example of numeric keypad binding
;; (global-set-key [(C kp-4)] 'fold-dwim-hide-all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; machine-dependent configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Running on machine:")
(message system-name)

;;(if (string-equal system-name "Kevins-MacBook-Pro.local")
(if (string-equal system-name "kevins-mbp.ra-int.com")
    ;;--------------------------------------------------------------------
    ;;
    ;; Customizations specific to my my work Mac Book Pro.
    ;;
    ;;--------------------------------------------------------------------
    (progn
      (message "Running on Kevin's Mac Book Pro")

      ;;
      ;; Setup the printer.
      ;;
      (setq ps-lpr-command "lpr")

      ;; This line causes ghostscript to query which printer to
      ;; use - which you may not need if, for example, you only
      ;; have one printer.
      (setq ps-lpr-switches '("-p"))

      ;; (setq ps-printer-name t)

      ;; (setq ps-print-color-p t)

      ;; ps-print vertical layout customizations.  Work printer seems
      ;; to shift everything down vertically.  Not sure why.
      '(ps-footer-offset 5.346456692913385)
      '(ps-header-offset 10.3)
      '(ps-top-margin 5.5)
      )
  )


(if (string-equal system-name "NAUSMAYHXW2PX1")
    ;;--------------------------------------------------------------------
    ;;
    ;; Customizations specific to my my work laptop.
    ;;
    ;;--------------------------------------------------------------------
    (progn
      (message "Running on NAUSMAYHXW2PX1")

      ;;
      ;; Setup the printer.
      ;;
      (setq ps-lpr-command "C:\\Program Files\\Ghostgum\\gsview\\gsprint.exe")

      ;; This line causes ghostscript to query which printer to
      ;; use - which you may not need if, for example, you only
      ;; have one printer.
      (setq ps-lpr-switches '("-query"))

      (setq ps-printer-name t)

      (setq ps-print-color-p t)

      ;;
      ;; Setup the shell.
      ;;

      ;; The shortcut to Git Bash is:
      ;;"C:\Program Files (x86)\Git\bin\sh.exe" --login -i

      (setq explicit-shell-file-name "C:/Program Files (x86)/Git/bin/sh.exe")
      (setq shell-file-name "sh.exe")
      (setq explicit-sh.exe-args '("--login" "-i"))
      (setenv "SHELL" shell-file-name)
      (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

      )
  )


(if (string-equal system-name "USMAYKWPETERS1")
    ;;--------------------------------------------------------------------
    ;;
    ;; Customizations specific to my my work desktop.
    ;;
    ;;--------------------------------------------------------------------
    (progn
      (message "Running on Kevin's work desktop")

      ;;
      ;; Setup the printer.
      ;;
      (setq ps-lpr-command "C:\\Program Files (x86)\\Ghostgum\\gsview\\gsprint.exe")

      ;; This line causes ghostscript to query which printer to
      ;; use - which you may not need if, for example, you only
      ;; have one printer.
      (setq ps-lpr-switches '("-query"))

      (setq ps-printer-name t)

      (setq ps-print-color-p t)
      )
  )


;;------------------------------------------------------------------------------
;; kwp-elem-complete
;;
;; Completes an XML/HTML element when the cursor is to the right of
;; the opening element.
;;------------------------------------------------------------------------------
(fset 'kwp-elem-complete
   [?\C-r ?< right ?\C-  C-right ?\M-w ?\C-r ?< right left ?\C-s ?> left right ?< ?/ ?\C-y ?> ?\C-r ?< left right])
(global-set-key (kbd "C-; e") 'kwp-elem-complete)


;;------------------------------------------------------------------------------
;; kwp-create-curlies
;;
;; Creates matching curly braces.
;;------------------------------------------------------------------------------
(fset 'kwp-create-curlies
   [?\{ return ?\} ?\C-a return up tab])
(global-set-key (kbd "C-; {") 'kwp-create-curlies)


;;------------------------------------------------------------------------------
;; kwp-create-parens
;;
;; Creates matching parenthesis.
;;------------------------------------------------------------------------------
(fset 'kwp-create-parens
   "()\C-b")
(global-set-key (kbd "C-; (") 'kwp-create-parens)


;;------------------------------------------------------------------------------
;; kwp-create-single-quotes
;;
;; Creates matching single quotes.
;;------------------------------------------------------------------------------
(fset 'kwp-create-single-quotes
   "''\C-b")
(global-set-key (kbd "C-; '") 'kwp-create-single-quotes)


;;------------------------------------------------------------------------------
;; kwp-create-double-quotes
;;
;; Creates matching double quotes.
;;------------------------------------------------------------------------------
(fset 'kwp-create-double-quotes
   "\"\"\C-b")
(global-set-key (kbd "C-; \"") 'kwp-create-double-quotes)


;;------------------------------------------------------------------------------
;; kwp-append-semicolon
;;
;; Puts a semicolon at the end of the line without moving the cursor.
;;------------------------------------------------------------------------------
(fset 'kwp-append-semicolon
   [?\C-  ?\C-  ?\C-e ?\; ?\C-u ?\C- ])
(global-set-key (kbd "C-; ;") 'kwp-append-semicolon)


;;------------------------------------------------------------------------------
;; kwp-insert-three-line-comment
;;
;; Inserts a 3-lined comment (nice whitespace).
;;------------------------------------------------------------------------------
(fset 'kwp-insert-three-line-comment
   [tab ?/ ?/ return tab ?/ ?/ return tab ?/ ?/ up ?\C-e ? ])
(global-set-key (kbd "C-; 3") 'kwp-insert-three-line-comment)


;;------------------------------------------------------------------------------
;; kwp-copy-buffer
;;
;; Copies the current buffer to the clipboard.
;;------------------------------------------------------------------------------
(fset 'kwp-copy-buffer
   [?\C-  ?\C-  ?\M-< ?\C-  ?\M-> ?\M-w ?\C-u ?\C-  ?\C-u ?\C- ])


;;------------------------------------------------------------------------------
;; kwp-indent-buffer
;;
;; Reindents the entire buffer.
;;------------------------------------------------------------------------------
(fset 'kwp-indent-buffer
   [?\C-  ?\C-  ?\M-< ?\C-  ?\M-> ?\M-x ?i ?n ?d ?e ?n ?t ?- ?r ?e ?g ?i ?o ?n return ?\C-u ?\C-  ?\C-u ?\C- ])

;;------------------------------------------------------------------------------
;; kwp-delete-whitespace-right
;;
;; Deletes whitespace to the right of cursor.
;;------------------------------------------------------------------------------
(fset 'kwp-delete-whitespace-right
   [?\C-  ?\C-\M-s ?^ ?\[ ?\[ ?: ?s ?p ?a ?c ?e ?: ?\] ?\] ?+ right left ?\C-w ?\C-e])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Key bindings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f5]          'revert-buffer)
(global-set-key [f6]          'goto-line)
(global-set-key [f12]         'kwp-del-whitespace)

(global-set-key (kbd "C-; n") 'next-multiframe-window)
(global-set-key (kbd "C-; p") 'previous-multiframe-window)
(global-set-key (kbd "C-; i") 'indent-region)
(global-set-key (kbd "C-; f") 'hs-toggle-hiding)  ;; "f" for folding

(global-set-key (kbd "C-S-n") (lambda () (interactive) (scroll-up   1)))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (scroll-down 1)))

;; Growing/shrinking the width and height of the window interactively
;; using doremi.
;;
;; Each of these commands actually enables all four arrow keys, so
;; only one is necessary to enable the arrow keys.  But the mouse
;; wheel can only be tied to the width or height.
(global-set-key (kbd "S-C-h") 'doremi-window-width+)
(global-set-key (kbd "S-C-v") 'doremi-window-height+)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Moving lines up/down
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(global-set-key [\M-\S-up] 'move-text-up)
(global-set-key [\M-\S-down] 'move-text-down)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Indent Whole Buffer
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun iwb ()
  "indent whole buffer"
  (interactive)
  ;; (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Advanced beginning of line functionality
;;
;; http://stackoverflow.com/questions/6035872/moving-to-the-start-of-a-code-line-emacs
;;
;; In all honesty, I should just learn to use M-m.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun beginning-of-line-or-indentation ()
  "move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Helpful key binding examples:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; How to specify the meta key
;; (global-set-key "\M-n"  (lambda () (interactive) (scroll-up   4)) )
;; (global-set-key "\M-p"  (lambda () (interactive) (scroll-down 4)) )

;; How to specify the control key, up and down
;; (global-set-key [(control down)] 'kwp-scroll-down)
;; (global-set-key [(control up)]   'kwp-scroll-up)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
