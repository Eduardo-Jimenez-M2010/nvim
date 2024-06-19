--SETTINGS MAIN FILE

--Nvim configurations
package.loaded['settings/configurations'] = nil
require('settings/configurations')
--Language Servers
package.loaded['settings/lsp-settings'] = nil
require('settings/lsp-settings')
--Keybindings
package.loaded['settings/keybindings'] = nil
require('settings/keybindings')
--ColorThemes
package.loaded['settings/colorthemes'] = nil
require('settings/colorthemes')
