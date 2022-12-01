description 'Admin'
name ' admin'
author 'bp_admin'
version 'v1.0.0'



ui_page 'html/index.html'


files {
  'html/index.html',
  'html/*.js',
  'html/*.css',
  'html/*.png',
  'html/*.svg',
  'html/*.otf'





    

}

client_scripts {
    'config.lua',
    'framework/cl_wrapper.lua',
    'client.lua'

}

server_scripts {
    'config.lua',
    'framework/sv_wrapper.lua',
    'server.lua'
}


fx_version 'adamant'
games {'gta5'}