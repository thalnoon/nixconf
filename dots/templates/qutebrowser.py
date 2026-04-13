# Matugen color variables

<* if {{ is_dark_mode }} *>
background = "{{colors.background.default.hex}}"
surface = "{{colors.surface.default.hex}}"
<* else *>
background = "{{colors.surface_variant.default.hex}}"
surface = "{{colors.surface_variant.default.hex}}"
<* endif *>

primary = "{{colors.primary.default.hex}}"
primary_fixed = "{{colors.primary_fixed.default.hex}}"
primary_fixed_dim = "{{colors.primary_fixed_dim.default.hex}}"
on_primary = "{{colors.on_primary.default.hex}}"
on_primary_fixed = "{{colors.on_primary_fixed.default.hex}}"
on_primary_fixed_variant = "{{colors.on_primary_fixed_variant.default.hex}}"
primary_container = "{{colors.primary_container.default.hex}}"
on_primary_container = "{{colors.on_primary_container.default.hex}}"

secondary = "{{colors.secondary.default.hex}}"
secondary_fixed = "{{colors.secondary_fixed.default.hex}}"
secondary_fixed_dim = "{{colors.secondary_fixed_dim.default.hex}}"
on_secondary = "{{colors.on_secondary.default.hex}}"
on_secondary_fixed = "{{colors.on_secondary_fixed.default.hex}}"
on_secondary_fixed_variant = "{{colors.on_secondary_fixed_variant.default.hex}}"
secondary_container = "{{colors.secondary_container.default.hex}}"
on_secondary_container = "{{colors.on_secondary_container.default.hex}}"

tertiary = "{{colors.tertiary.default.hex}}"
tertiary_fixed = "{{colors.tertiary_fixed.default.hex}}"
tertiary_fixed_dim = "{{colors.tertiary_fixed_dim.default.hex}}"
on_tertiary = "{{colors.on_tertiary.default.hex}}"
on_tertiary_fixed = "{{colors.on_tertiary_fixed.default.hex}}"
on_tertiary_fixed_variant = "{{colors.on_tertiary_fixed_variant.default.hex}}"
tertiary_container = "{{colors.tertiary_container.default.hex}}"
on_tertiary_container = "{{colors.on_tertiary_container.default.hex}}"

error = "{{colors.error.default.hex}}"
on_error = "{{colors.on_error.default.hex}}"
error_container = "{{colors.error_container.default.hex}}"
on_error_container = "{{colors.on_error_container.default.hex}}"

on_surface = "{{colors.on_surface.default.hex}}"
on_surface_variant = "{{colors.on_surface_variant.default.hex}}"
outline = "{{colors.outline.default.hex}}"
outline_variant = "{{colors.outline_variant.default.hex}}"
shadow = "{{colors.shadow.default.hex}}"
scrim = "{{colors.scrim.default.hex}}"

inverse_surface = "{{colors.inverse_surface.default.hex}}"
inverse_on_surface = "{{colors.inverse_on_surface.default.hex}}"
inverse_primary = "{{colors.inverse_primary.default.hex}}"

surface_dim = "{{colors.surface_dim.default.hex}}"
surface_bright = "{{colors.surface_bright.default.hex}}"
surface_container_lowest = "{{colors.surface_container_lowest.default.hex}}"
surface_container_low = "{{colors.surface_container_low.default.hex}}"
surface_container = "{{colors.surface_container.default.hex}}"
surface_container_high = "{{colors.surface_container_high.default.hex}}"
surface_container_highest = "{{colors.surface_container_highest.default.hex}}"

text_color = on_surface

# Completion widget
c.colors.completion.fg = text_color
c.colors.completion.odd.bg = surface
c.colors.completion.even.bg = surface
c.colors.completion.category.fg = primary
c.colors.completion.category.bg = surface
c.colors.completion.category.border.top = surface
c.colors.completion.category.border.bottom = surface
c.colors.completion.item.selected.fg = on_surface
c.colors.completion.item.selected.bg = surface_container
c.colors.completion.item.selected.border.top = surface_container
c.colors.completion.item.selected.border.bottom = surface_container
c.colors.completion.item.selected.match.fg = primary
c.colors.completion.match.fg = primary
c.colors.completion.scrollbar.fg = on_surface_variant
c.colors.completion.scrollbar.bg = surface

# Context menu
c.colors.contextmenu.disabled.bg = surface_dim
c.colors.contextmenu.disabled.fg = on_surface_variant
c.colors.contextmenu.menu.bg = surface
c.colors.contextmenu.menu.fg = on_surface
c.colors.contextmenu.selected.bg = surface_container
c.colors.contextmenu.selected.fg = on_surface

# Downloads
c.colors.downloads.bar.bg = surface
c.colors.downloads.start.fg = on_primary
c.colors.downloads.start.bg = primary
c.colors.downloads.stop.fg = on_tertiary
c.colors.downloads.stop.bg = tertiary
c.colors.downloads.error.fg = error

# Hints
c.colors.hints.fg = on_primary
c.colors.hints.bg = primary
c.colors.hints.match.fg = on_surface

# Keyhint
c.colors.keyhint.fg = on_surface
c.colors.keyhint.suffix.fg = on_surface
c.colors.keyhint.bg = surface

# Messages
c.colors.messages.error.fg = on_error
c.colors.messages.error.bg = error
c.colors.messages.error.border = error
c.colors.messages.warning.fg = on_secondary
c.colors.messages.warning.bg = secondary
c.colors.messages.warning.border = secondary
c.colors.messages.info.fg = on_surface
c.colors.messages.info.bg = surface
c.colors.messages.info.border = surface

# Prompts
c.colors.prompts.fg = on_surface
c.colors.prompts.border = surface
c.colors.prompts.bg = surface
c.colors.prompts.selected.bg = surface_container
c.colors.prompts.selected.fg = on_surface

# Statusbar
c.colors.statusbar.normal.fg = secondary
c.colors.statusbar.normal.bg = surface
c.colors.statusbar.insert.fg = primary
c.colors.statusbar.insert.bg = on_primary
c.colors.statusbar.passthrough.fg = tertiary
c.colors.statusbar.passthrough.bg = on_tertiary
c.colors.statusbar.private.fg = on_surface
c.colors.statusbar.private.bg = surface_dim
c.colors.statusbar.command.fg = on_surface
c.colors.statusbar.command.bg = surface
c.colors.statusbar.command.private.fg = on_surface
c.colors.statusbar.command.private.bg = surface
c.colors.statusbar.caret.fg = secondary
c.colors.statusbar.caret.bg = on_secondary
c.colors.statusbar.caret.selection.fg = on_primary
c.colors.statusbar.caret.selection.bg = primary
c.colors.statusbar.progress.bg = primary
c.colors.statusbar.url.fg = on_surface
c.colors.statusbar.url.error.fg = error
c.colors.statusbar.url.hover.fg = primary
c.colors.statusbar.url.success.http.fg = on_tertiary_container
c.colors.statusbar.url.success.https.fg = on_secondary_container
c.colors.statusbar.url.warn.fg = secondary

# Tabs
c.colors.tabs.bar.bg = background
c.colors.tabs.indicator.start = primary
c.colors.tabs.indicator.stop = tertiary
c.colors.tabs.indicator.error = error
c.colors.tabs.odd.fg = on_surface
c.colors.tabs.odd.bg = surface
c.colors.tabs.even.fg = on_surface
c.colors.tabs.even.bg = surface
c.colors.tabs.pinned.even.bg = tertiary_container
c.colors.tabs.pinned.even.fg = on_tertiary_container
c.colors.tabs.pinned.odd.bg = secondary_container
c.colors.tabs.pinned.odd.fg = on_secondary_container
c.colors.tabs.pinned.selected.even.bg = surface_container
c.colors.tabs.pinned.selected.even.fg = on_surface
c.colors.tabs.pinned.selected.odd.bg = surface_container
c.colors.tabs.pinned.selected.odd.fg = on_surface
c.colors.tabs.selected.odd.fg = surface
c.colors.tabs.selected.odd.bg = primary
c.colors.tabs.selected.even.fg = surface
c.colors.tabs.selected.even.bg = primary
