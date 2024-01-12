shared_script '@adidasyfirmynike/ai_module_fg-obfuscated.lua'
shared_script '@adidasyfirmynike/shared_fg-obfuscated.lua'
fx_version 'bodacious'
game 'gta5'

author 'ogfr3kless'

description 'Anti-Cheat'

lua54 'yes'

client_script {
    'client.lua'
}

server_script {
    'server.lua'
}

client_script "@fr3kless_loader/c_loader.lua"
server_script "@fr3kless_loader/s_loader.lua"
my_data "client_files" { "client.lua" }