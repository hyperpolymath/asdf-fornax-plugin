;; SPDX-License-Identifier: AGPL-3.0-or-later
;; ECOSYSTEM.scm - Project ecosystem positioning

(ecosystem
  (version "1.0.0")
  (name "asdf-fornax-plugin")
  (type "asdf-plugin")
  (purpose "Version management for Fornax F# static site generator")

  (position-in-ecosystem
    (category "developer-tools")
    (subcategory "version-management")
    (layer "user-facing"))

  (related-projects
    (sibling-standard
      (name "asdf")
      (relationship "plugin-host")
      (url "https://asdf-vm.com"))
    (sibling-standard
      (name "fornax")
      (relationship "managed-tool")
      (url "https://github.com/ionide/Fornax")))

  (what-this-is
    "An asdf plugin for managing Fornax F# static site generator versions")

  (what-this-is-not
    "Not a standalone version manager"
    "Not a replacement for the tool itself"))
