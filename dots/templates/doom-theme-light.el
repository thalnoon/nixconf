;; Modus themes config
(use-package modus-themes
  :config
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-completions '((matches . (bold))
                                   (selection . (semibold text-also)))
        )
  (setq modus-themes-common-palette-overrides
        '((bg-line-number-inactive unspecified)
          (bg-line-number-active unspecified)
          (bg-region "{{palettes.tertiary._80.hex | to_color | lighten: 5.0}}") ; neutral with mix of accent
          (bg-hl-line "{{palettes.primary._80.hex | to_color | lighten: 5.0}}")
          (fg-button-active "{{colors.on_surface.default.hex}}")
          (fnname-call magenta-warmer)
          (keyword magenta-intense)
          (type cyan-intense)
          (fg-prompt blue-intense)
          (fg-region unspecified)
          (fringe bg-main)
          (fg-line-number-active matugen-pri)
          (rainbow-4 yellow-warmer)
          (fg-heading-1 rainbow-1)
          (fg-heading-2 rainbow-2)
          (fg-heading-3 rainbow-3)
          (fg-heading-4 rainbow-4)
          (fg-heading-5 rainbow-5)
          (fg-heading-6 rainbow-6)
          (fg-heading-7 rainbow-7)
          (fg-heading-8 rainbow-8)
          ))
  (setq modus-operandi-palette-user
        '((matugen-pri "{{colors.primary.default.hex}}")
          (matugen-pri-warmer "{{palettes.primary._60.hex | to_color | harmonize: {{ "#c40c0c" | to_color }} | lighten: -10.0}}")
          (matugen-pri-cooler "{{palettes.primary._60.hex | to_color | harmonize: {{ "#0ac4e0" | to_color }} | lighten: 10.0}}")
          (matugen-pri-faint "{{palettes.primary._60.hex | to_color | set_saturation: 35.0 | lighten: 10.0}}")
          (matugen-pri-intense "{{palettes.primary._30.hex | to_color | lighten: 5.0}}")

          (matugen-sec "{{colors.secondary.default.hex}}")
          (matugen-sec-warmer "{{palettes.secondary._60.hex | to_color | harmonize: {{ "#c40c0c" | to_color }} | lighten: -5.0}}")
          (matugen-sec-cooler "{{palettes.secondary._60.hex | to_color | harmonize: {{ "#0ac4e0" | to_color }} | lighten: 5.0}}")
          (matugen-sec-faint "{{palettes.secondary._60.hex | to_color | set_saturation: 15.0 | lighten: 3.0}}")
          (matugen-sec-intense "{{palettes.secondary._30.hex | to_color | lighten: 5.0}}")

          (matugen-tert "{{colors.tertiary.default.hex}}")
          (matugen-tert-warmer "{{palettes.tertiary._60.hex | to_color | harmonize: {{ "#c40c0c" | to_color }}}}")
          (matugen-tert-cooler "{{palettes.tertiary._60.hex | to_color | harmonize: {{ "#0ac4e0" | to_color }} | lighten: 5.0 }}")
          (matugen-tert-faint "{{palettes.tertiary._60.hex | to_color | set_saturation: 35.0 | lighten: 5.0}}")
          (matugen-tert-intense "{{palettes.tertiary._30.hex | to_color | lighten: 5.0}}")

          (matugen-neut-var "{{palettes.neutral_variant._60.hex}}")  ;neutral-variant-60
          (matugen-comment "{{palettes.neutral_variant._60.hex | to_color | blend: {{colors.primary.default.hex | to_color}}, 0.5}}")
          (matugen-on-sec-container "{{colors.on_primary_fixed_variant.default.hex}}")
          (warning "{{colors.yellow.default.hex | blend: {{ colors.rust.default.hex }}, 0.6 }}")
          (buffer-modeline "{{colors.tertiary.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | lighten: -5.0}}")
          (bar-modeline "{{colors.tertiary.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | lighten: -2.5}}")
          )
        )

  (setq modus-operandi-palette-overrides
        '(
          (bg-main "{{colors.surface_variant.default.hex | to_color | lighten: 1.0}}")           ;background
          (bg-dim "{{colors.secondary_fixed_dim.default.hex | to_color | set_saturation: 25.0 | lighten: 3.5}}")           ;background
          (fg-main "{{colors.on_surface.default.hex}}")           ;on-surface
          (fg-dim matugen-neut-var)            ;outline
          (comment matugen-comment)
          (bg-active "{{colors.surface_container.default.hex | to_color | lighten: -5.0}}")         ;primary
          (bg-inactive "{{colors.inverse_on_surface.default.hex | to_color | lighten: -5.0}}")       ;surface-variant
          (bg-mode-line-active "{{colors.primary_container.default.hex | to_color | set_saturation: 69.0 |  lighten: -4.0}}") ;primary-container
          (fg-mode-line-active "{{colors.on_primary_container.default.hex | harmonize: {{ colors.primary_container.default.hex | to_color }} }}") ;primary-container
          (bg-mode-line-inactive "{{colors.secondary_container.default.hex | to_color | set_saturation: 25.0 |  lighten: -5.0}}") ;secondary_container
          (fg-mode-line-inactive "{{colors.on_surface_variant.default.hex | harmonize: {{ colors.secondary_container.default.hex | to_color }} }}") ;secondary_container
          (err "{{colors.error.default.hex}}")                   ;error
          (underline-err err)
          (modeline-err err)
          (variable blue-intense)
          (modeline-info "{{colors.blue_source.default.hex | to_color | harmonize: {{ colors.source_color.default.hex | to_color }} }}")
          (modeline-warning warning)
          (bg-prominent-err "{{colors.error_container.default.hex}}")      ;error_container
          (cursor "{{colors.secondary.default.hex | to_color | harmonize: {{ colors.primary.default.hex | to_color }} }}")
          (border-mode-line-active bg-mode-line-active)
          (fg-completion-match-0 magenta-warmer)
          (fg-completion-match-1 blue-intense)
          (bg-completion "{{palettes.tertiary._80.hex}}")

          (string "{{ colors.tertiary.default.hex | to_color | harmonize: {{ palettes.neutral_variant._50.hex }}}}")

          ;; syntax
          (magenta matugen-pri)
          (magenta-warmer matugen-pri-warmer)
          (magenta-cooler matugen-pri-cooler)
          (magenta-faint matugen-pri-faint)
          (magenta-intense matugen-pri-intense)


          (blue matugen-sec)
          (blue-warmer matugen-sec-warmer)
          (blue-cooler matugen-sec-cooler)
          (blue-faint matugen-sec-faint)
          (blue-intense matugen-sec-intense)


          (cyan matugen-tert)
          (cyan-warmer matugen-tert-warmer)
          (cyan-cooler matugen-tert-cooler)
          (cyan-faint matugen-tert-faint)
          (cyan-intense matugen-tert-intense)

          (yellow "{{ colors.yellow_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | lighten: -10.0}}")
          (yellow-warmer "{{colors.yellow_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | harmonize: {{ "#c40c0c" | to_color }} | to_color | lighten: -10.0}}")
          (yellow-cooler "{{colors.yellow_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | harmonize: {{ "#0ac4e0" | to_color }} | to_color | lighten: -10.0 }}")
          (yellow-faint "{{ colors.yellow_source.default.hex | harmonize: {{ colors.source_color.default.hex }}  | to_color | set_saturation: 45.0 | to_color | lighten: -10.0}}")
          (yellow-intense "{{colors.yellow_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | set_saturation: 100.0 | to_color | lighten: -10.0}}")

          (green "{{ colors.green_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | lighten: -10.0}}")
          (green-warmer "{{colors.green_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | harmonize: {{ "#c40c0c" | to_color }} | to_color | lighten: -10.0}}")
          (green-cooler "{{colors.green_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | harmonize: {{ "#0ac4e0" | to_color }} | to_color | lighten: -10.0 }}")
          (green-faint "{{ colors.green_source.default.hex | harmonize: {{ colors.source_color.default.hex }}  | to_color | set_saturation: 45.0 | to_color | lighten: -10.0}}")
          (green-intense "{{colors.green_source.default.hex | harmonize: {{ colors.source_color.default.hex }} | to_color | to_color | lighten: -10.0}}")


          (rust "{{ colors.rust_source.default.hex | harmonize: {{ colors.source_color.default.hex }} }}")
          (gold "{{ colors.gold_source.default.hex | harmonize: {{ colors.source_color.default.hex }} }}")
          (olive "{{ colors.olive_source.default.hex | harmonize: {{ colors.source_color.default.hex }} }}")
          (slate "{{ colors.slate_source.default.hex | harmonize: {{ colors.source_color.default.hex }} }}")
          (indigo "{{ colors.indigo_source.default.hex | harmonize: {{ colors.source_color.default.hex }} }}")
          (pink "{{ colors.pink_source.default.hex | harmonize: {{ colors.source_color.default.hex }} }}")
          (maroon "{{ colors.maroon_source.default.hex | harmonize: {{ colors.source_color.default.hex }} }}")
          )
        )
  )

(defun my-modus-themes-custom-faces (&rest _)

  (defface bold-text-iden-face
    '((t :weight bold))
    "A custom face for bold text in Text modes (markdown, typst, org etc...).")

  (defface italic-text-iden-face
    '((t :slant italic))
    "A custom face for italic text in Text modes (markdown, typst, org etc...).")

  (modus-themes-with-colors
    (custom-set-faces!
      '(lin-cyan :background "{{palettes.secondary._80.hex | to_color | lighten: 5.0}}")

      `(diredfl-dir-name :foreground ,rust)
      `(dired-directory :foreground ,rust)
      `(marginalia-file-priv-dir :foreground ,rust)
      ;; '(diredfl-dir-name :foreground "{{base16.base09.default.hex}}")
      ;; '(dired-directory :foreground "{{base16.base09.default.hex}}")
      ;; '(marginalia-file-priv-dir :foreground "{{base16.base09.default.hex}}")
      '(diredfl-flag-mark :background "{{colors.secondary_container.default.hex | to_color | lighten: -3.0}}" :foreground "{{colors.on_secondary_container.default.hex | to_color | blend: {{ "#f2b949" | to_color }}, 0.3}}")
      '(diredfl-flag-mark-line :background "{{colors.secondary_container.default.hex | to_color | lighten: -3.0}}" :foreground "{{colors.on_secondary_container.default.hex | to_color | blend: {{ "#f2b949" | to_color }}, 0.3}}")

      `(font-lock-constant-face :weight bold :foreground ,cyan-warmer)
      `(highlight-quoted-symbol :inherit nil :foreground ,rust)
      '(marginalia-key :foreground "{{colors.tertiary.default.hex | to_color | harmonize: {{ "#c40c0c" | to_color }}}}")

      `(corfu-default :background ,bg-main :foreground ,fg-main)
      `(corfu-border :background ,matugen-on-sec-container)
      `(consult-preview-insertion :background "{{palettes.secondary._80.hex | to_color | lighten: 5.0}}")

      `(doom-modeline-evil-insert-state :foreground ,maroon)
      `(doom-modeline-evil-visual-state :foreground ,indigo)
      `(doom-modeline-bar :background ,bar-modeline)
      `(doom-modeline-lsp-success :foreground ,green-cooler)
      `(doom-modeline-info :foreground ,cyan)
      `(doom-modeline-buffer-modified :weight bold :foreground ,buffer-modeline)

      `(lsp-ui-peek-highlight :background ,bg-yellow-nuanced :box nil)
      `(isearch :background ,bg-yellow-subtle)
      `(lazy-highlight :background ,bg-blue-subtle)
      `(evil-ex-lazy-highlight :background ,bg-blue-subtle)
      `(evil-ex-search :background ,bg-yellow-subtle)
      `(popup-isearch-match :background ,bg-yellow-subtle)

      `(italic-text-iden-face :foreground ,maroon :slant italic)
      `(bold-text-iden-face :foreground ,gold :weight bold)
      '(markdown-bold-face :inherit bold-text-iden-face)
      '(markdown-italic-face :inherit italic-text-iden-face)
      ))

  (after! org
    (setq org-emphasis-alist
          '(("*" bold-text-iden-face)
            ("/" italic-text-iden-face))))

  (after! corfu
    (setq corfu-border-width 1))
  )
(add-hook 'doom-load-theme-hook #'my-modus-themes-custom-faces)

(setq doom-theme 'modus-operandi)
(load-theme 'modus-operandi :no-confirm)
