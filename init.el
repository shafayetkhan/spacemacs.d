;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     ;;(c-c++ :variables c-c++-enable-clang-support t)
     c-c++
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     git
     ;; markdown
     org
     ;;UX ;; My private layer for the look and feel of emacs
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     themes-megapack
     (colors :variables
             colors-enable-rainbow-identifiers nil
             colors-enable-nyan-cat-progress-bar (display-graphic-p)))
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(helm-projectile
                                      (materialistic-set-theme :location "~/code/emacs-configs/materialistic-seti")
                                      ibuffer-vc
                                      fullframe
                                      helm-ag
                                      semantic
                                      hlinum
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(;;materialistic-seti
                         monokai
                         spacemacs-light
                         spacemacs-dark
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   dotspacemacs-default-font '("Inconsolata"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1.0
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default git-magit-status-fullscreen t)
  ;; This should go in the config.el of the UX layer
  (defvar spacemacs-evil-cursors '(("normal" "DarkGoldenrod2" box)
                                   ("insert" "chartreuse3" (bar . 2))
                                   ("emacs" "red" box)
                                   ("hybrid" "chartreuse3" (bar . 2))
                                   ("replace" "chocolate" (hbar . 2))
                                   ("evilified" "LightGoldenrod3" box)
                                   ("visual" "gray" (hbar . 2))
                                   ("motion" "plum3" box)
                                   ("lisp" "HotPink1" box)
                                   ("iedit" "firebrick1" box)
                                   ("iedit-insert" "firebrick1" (bar . 2)))
    "Colors assigned to evil states with cursor definitions."))


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
 ;; (add-to-list 'custom-theme-load-path "~/code/emacs-configs/materialistic-seti")
 ;; (load-theme 'materialistic-seti)
 (add-hook 'prog-mode-hook #'linum-mode)
 (require 'materialistic-seti-theme)
 (cua-selection-mode t)
 (setq linum-format (if (not window-system) "%4d " "%4d"))
 (hlinum-activate)
 (which-function-mode)
 (setq which-func-unknown "n/a")
 ;; (setq powerline-default-separator 'arrow-fade)
 ;; (spaceline-compile)
 ;; Key Bindings
 (global-set-key (kbd "C-z") 'evil-emacs-state)
 (global-set-key (kbd "C-c C-f") 'spacemacs/helm-find-files)
 (add-hook 'c-mode-common-hook
           (lambda ()
             ;; Safe local variables
             (put 'helm-make-build-dir 'safe-local-variable 'stringp)
             (setq compilation-scroll-output 'first-error)
             ;;(setq compilation-scroll-output t)
             (semantic-mode 1)
             (global-semantic-stickyfunc-mode 1)
             (define-key c-mode-map (kbd "C-c h") 'ff-find-other-file)
             (define-key c++-mode-map (kbd "C-c h") 'ff-find-other-file)
             (with-eval-after-load 'projectile
               (push '("C" "h") projectile-other-file-alist)
               (push '("cxx" "h") projectile-other-file-alist))))
 ;; Git config
 (setq magit-repository-directories '("~/code/"))
 ;; Better Defaults from Sanityinc (Steve Purcell)
 ;; When splitting window, show (other-buffer) in the new window
 (defun split-window-func-with-other-buffer (split-function)
   (lexical-let ((s-f split-function))
     (lambda (&optional arg)
       "Split this window and switch to the new window unless ARG is provided."
       (interactive "P")
       (funcall s-f)
       (let ((target-window (next-window)))
         (set-window-buffer target-window (other-buffer))
         (unless arg
           (select-window target-window))))))

 (global-set-key "\C-x2" (split-window-func-with-other-buffer 'split-window-vertically))
 (global-set-key "\C-x3" (split-window-func-with-other-buffer 'split-window-horizontally))

 (defun sanityinc/toggle-delete-other-windows ()
   "Delete other windows in frame if any, or restore previous window config."
   (interactive)
   (if (and winner-mode
            (equal (selected-window) (next-window)))
       (winner-undo)
     (delete-other-windows)))

 (global-set-key "\C-x1" 'sanityinc/toggle-delete-other-windows)

 ;; Rearrange split windows
 (defun split-window-horizontally-instead ()
   (interactive)
   (save-excursion
     (delete-other-windows)
     (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

 (defun split-window-vertically-instead ()
   (interactive)
   (save-excursion
     (delete-other-windows)
     (funcall (split-window-func-with-other-buffer 'split-window-vertically))))

 (global-set-key "\C-c|" 'split-window-horizontally-instead)
 (global-set-key "\C-c_" 'split-window-vertically-instead)
 ;; Set keybinding to dedicate current window
 (global-set-key (kbd "C-c <down>") 'spacemacs/toggle-current-window-dedication)

 ;; ibuffer config from Sanityinc - this should really be in it's own layer
 (defun ibuffer-set-up-preferred-filters ()
   (ibuffer-vc-set-filter-groups-by-vc-root)
   (unless (eq ibuffer-sorting-mode 'filename/process)
     (ibuffer-do-sort-by-filename/process)))
 (add-hook 'ibuffer-hook 'ibuffer-set-up-preferred-filters)
 (setq-default ibuffer-show-empty-filter-groups nil)
 (with-eval-after-load 'ibuffer
             ;; Use human readable Size column instead of original one
             (define-ibuffer-column size-h
               (:name "Size" :inline t)
               (cond
                ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
                ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
                (t (format "%8d" (buffer-size))))))
 ;; Explicitly require ibuffer-vc to get its column definitions, which
 ;; can't be autoloaded
 (with-eval-after-load 'ibuffer
             (fullframe ibuffer ibuffer-quit))
 (with-eval-after-load 'ibuffer
             (require 'ibuffer-vc))
 ;; Modify the default ibuffer-formats (toggle with `)
 (setq ibuffer-formats
       '((mark modified read-only vc-status-mini " "
               (name 18 18 :left :elide)
               " "
               (size-h 9 -1 :right)
               " "
               (mode 16 16 :left :elide)
               " "
               filename-and-process)
         (mark modified read-only vc-status-mini " "
               (name 18 18 :left :elide)
               " "
               (size-h 9 -1 :right)
               " "
               (mode 16 16 :left :elide)
               " "
               (vc-status 16 16 :left)
               " "
               filename-and-process)))
 (setq ibuffer-filter-group-name-face 'font-lock-doc-face)
 (global-set-key (kbd "C-x C-b") 'ibuffer)
 ;; Xah Lee Make Backup of Current File
 (defun xah-make-backup ()
   "Make a backup copy of current file or dired marked files.
If in dired, backup current file or marked files.
The backup file name is
 ‹name›~‹timestamp›~
example:
 file.html~20150721T014457~
in the same dir. If such a file already exist, it's overwritten.
If the current buffer is not associated with a file, nothing's done.
URL `http://ergoemacs.org/emacs/elisp_make-backup.html'
Version 2015-10-14"
   (interactive)
   (let ((ξfname (buffer-file-name)))
     (if ξfname
         (let ((ξbackup-name
                (concat ξfname "~" (format-time-string "%Y%m%dT%H%M%S") "~")))
           (copy-file ξfname ξbackup-name t)
           (message (concat "Backup saved at: " ξbackup-name)))
       (if (string-equal major-mode "dired-mode")
           (progn
             (mapc (lambda (ξx)
                     (let ((ξbackup-name
                            (concat ξx "~" (format-time-string "%Y%m%dT%H%M%S") "~")))
                       (copy-file ξx ξbackup-name t)))
                   (dired-get-marked-files))
             (message "marked files backed up"))
         (user-error "buffer not file nor dired")))))

 (defun xah-make-backup-and-save ()
   "backup of current file and save, or backup dired marked files.
  For detail, see `xah-make-backup'.
  If the current buffer is not associated with a file, nothing's done.
  URL `http://ergoemacs.org/emacs/elisp_make-backup.html'
  Version 2015-10-14"
   (interactive)
   (if (buffer-file-name)
       (progn
         (xah-make-backup)
         (when (buffer-modified-p)
           (save-buffer)))
     (progn
       (xah-make-backup))))
 (global-set-key (kbd "C-c b") 'xah-make-backup-and-save)
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8baebc9660b01e1d71565869b492b3dc98299138e692aefe5427019a7c171f10" "ff349024280f2b64ebc0213f293261f48d03d1a1a335c43e86a11925765b01da" default)))
 '(evil-search-module (quote evil-search))
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(safe-local-variable-values (quote ((helm-make-build-dir . "./")))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(spacemacs-emacs-face ((t (:background "Red" :foreground "#49483E" :box (:line-width 1 :color "#3E3D31" :style unspecified) :inherit (quote mode-line)))))
;;  '(spacemacs-hybrid-face ((t (:background "chartreuse3" :foreground "#49483E" :box (:line-width 1 :color "#3E3D31" :style unspecified) :inherit (quote mode-line))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
