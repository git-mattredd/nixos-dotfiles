
# Firefox UI Fonts with JetBrainsMono Nerd Font (NF) on NixOS

This guide shows how to force **JetBrainsMono Nerd Font (NF)** for the **Firefox UI (tabs, menus, sidebar, etc.)** using `userChrome.css`.

---

## 1. Install JetBrainsMono Nerd Font

Add the font package to your `home.nix`:

```NixOS
fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
```
## 2. Firefox config

Open Firefox -> `about:config` and enter `toolkit.legacyUserProfileCustomizations.stylesheets` set to `true`

## 3. Locate legacyUserProfileCustomizations

```NixOS
ls ~/.mozilla/firefox/*.default*
```
You should see `xxxxxxxx.default-release`

## 4. Create and edit userChome.css

```NixOS

mkdir -p ~/.mozilla/firefox/xxxxxxx.default-release/chrome
vim ~/.mozilla/firefox/xxxxxxx.default-release/chrome/userChrome.css
```
---
And paste the following:

```NixOS

/* Force JetBrainsMono Nerd Font for the Firefox UI */
* {
  font-family: "JetBrainsMono Nerd Font", monospace !important;
}

/* Customize tab labels */
.tab-label {
  font-family: "JetBrainsMono Nerd Font", monospace !important;
  font-size: 12pt !important;
  font-weight: 500 !important;
}

```
---

# Restart and thats it!!

