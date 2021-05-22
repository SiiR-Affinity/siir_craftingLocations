fx_version 'cerulean'
game 'gta5'

description 'SiiR Vehicle Garage'

dependency 'es_extended'
dependency 'ghmattimysql'
shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
}

exports {
    'UpdateXP'
}