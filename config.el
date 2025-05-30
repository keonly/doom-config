;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

(setq doom-font (font-spec :family "Sarasa Mono K" :size 16 :weight 'regular)
     doom-variable-pitch-font (font-spec :family "Sarasa Mono K" :size 16)
     doom-symbol-font (font-spec :family "Iosevka Nerd Font Mono" :size 16 :weight 'regular))

(defun custom/apply-sarasa-to-hangul (&optional frame)
  (when (display-graphic-p frame)           ; skip TTY frames
    (with-selected-frame (or frame (selected-frame))
      (set-fontset-font nil 'hangul
                        (font-spec :family "Sarasa Mono K") ; explicit spec
                        nil 'prepend))))

;; first frame (after Doom has drawn it)
(add-hook! 'doom-init-ui-hook #'custom/apply-sarasa-to-hangul)
;; any frames you create later (daemon, pop-ups, etc.)
(add-hook! 'after-make-frame-functions #'custom/apply-sarasa-to-hangul)
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha)
(load-theme 'catppuccin t t)
(catppuccin-set-color 'crust "#000000")
(catppuccin-set-color 'mantle "#0b0b0b")
(catppuccin-set-color 'base "#161616")
(catppuccin-set-color 'surface0 "#262626")
(catppuccin-set-color 'surface1 "#393939")
(catppuccin-set-color 'surface2 "#525252")
(catppuccin-set-color 'overlay0 "#6f6f6f")
(catppuccin-set-color 'overlay1 "#8d8d8d")
(catppuccin-set-color 'overlay2 "#a8a8a8")
(catppuccin-set-color 'subtext0 "#c6c6c6")
(catppuccin-set-color 'subtext1 "#e0e0e0")
(catppuccin-set-color 'text "#f4f4f4")
(catppuccin-reload)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! doom-modeline
  (setq doom-modeline-modal-icon nil
        doom-modeline-modal-modern-icon nil))
(setq evil-normal-state-tag   "NORMAL"
      evil-insert-state-tag   "INSERT"
      evil-visual-state-tag   "VISUAL"
      evil-replace-state-tag  "REPLACE"
      evil-motion-state-tag   "MOTION"
      evil-operator-state-tag "OPERATOR")

(setq insert-directory-program
      (or (executable-find "uutils-ls")
          (executable-find "ls")))
(after! dired
  (setq dired-use-ls-dired t
        dired-listing-switches "-alh --group-directories-first"))
