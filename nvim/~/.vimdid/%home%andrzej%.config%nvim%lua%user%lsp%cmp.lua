Vim�UnDo� �0s�N#�;X�~�UN�&��S�,sֶ����                                      c;qb    _�                             ����                                                                                                                                                                                                                                                                                                                                                             c2Pq    �                 �                 local cmp = require('cmp')   cmp.setup({     snippet = {   6    -- REQUIRED by nvim-cmp. get rid of it once we can       expand = function(args)   *      vim.fn["vsnip#anonymous"](args.body)       end,     },     mapping = {   4    -- Tab immediately completes. C-n/C-p to select.   6    ['<Tab>'] = cmp.mapping.confirm({ select = true })     },      sources = cmp.config.sources({   Q    -- TODO: currently snippets from lsp end up getting prioritized -- stop that!       { name = 'nvim_lsp' },     }, {       { name = 'path' },     }),     experimental = {       ghost_text = true,     },   })       -- Enable completing paths in :   cmp.setup.cmdline(':', {      sources = cmp.config.sources({       { name = 'path' }     })   })5��                                 �      �      �                          �                     5�_�                   	        ����                                                                                                                                                                                                                                                                                                                            	                              c2P�    �   	            8        -- Tab immediately completes. C-n/C-p to select.   :        ['<Tab>'] = cmp.mapping.confirm({ select = true })       },�      
             mapping = {5��                          �                      �    	                      �                      �    
                      &                     �                          d                     5�_�                            ����                                                                                                                                                                                                                                                                                                                            	                              c2QO     �   
            =--         ['<Tab>'] = cmp.mapping.confirm({ select = true })�             5��    
                 C   '              �       5�_�                            ����                                                                                                                                                                                                                                                                                                                            	                              c2QP     �   
            D-['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),5��    
                      &                     5�_�                       M    ����                                                                                                                                                                                                                                                                                                                            	                              c2QT    �               ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),-         ['<Tab>'] = cmp.mapping.confirm({ select = true })5��       L                  �                     �       K                  �                     �       J                  �                     �       I                  �                     �       H                  �                     �       G                  �                     �       F                  �                     �       E                  �                     �       D                  �                     �       C                  �                     �       C                  �                     5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            	                              c2QX     �      
         --     mapping = {5��                          �                      5�_�      	              	        ����                                                                                                                                                                                                                                                                                                                            	                              c2QY     �      
         -     mapping = {5��                          �                      5�_�      
           	   
        ����                                                                                                                                                                                                                                                                                                                            	                              c2QY     �   	            ;--         -- Tab immediately completes. C-n/C-p to select.5��    	                      �                      5�_�   	              
   
        ����                                                                                                                                                                                                                                                                                                                            	                              c2QY     �   	            :-         -- Tab immediately completes. C-n/C-p to select.5��    	                      �                      5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            	                              c2Q[     �               	--     },5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                            	                              c2Q[     �               -     },5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                            	                              c2Q[    �                  �                  local cmp = require('cmp')   cmp.setup({       snippet = {   :        -- REQUIRED by nvim-cmp. get rid of it once we can           expand = function(args)   0            vim.fn["vsnip#anonymous"](args.body)           end,       },        mapping = {   9         -- Tab immediately completes. C-n/C-p to select.   C['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),   C['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),   2['<Tab>'] = cmp.mapping.confirm({ select = true })        },   "    sources = cmp.config.sources({   U        -- TODO: currently snippets from lsp end up getting prioritized -- stop that!           { name = 'nvim_lsp' },       }, {           { name = 'path' },       }),       experimental = {           ghost_text = true,       },   })       -- Enable completing paths in :   cmp.setup.cmdline(':', {   "    sources = cmp.config.sources({           { name = 'path' }       })   })5��                                 c            �                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                          c2Qb     �                :        ['<Tab>'] = cmp.mapping.confirm({ select = true })5��                          �      ;               5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                          c2Qb   	 �   
          �   
          5��    
                                     ;       5�_�                       :    ����                                                                                                                                                                                                                                                                                                                                                          c2Qe     �   
            :        ['<Tab>'] = cmp.mapping.confirm({ select = true })5��    
   :                  Z                     5�_�                       N    ����                                                                                                                                                                                                                                                                                                                                                          c2Qf   
 �               N        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),5��       M                  �                     5�_�                       L    ����                                                                                                                                                                                                                                                                                                                                                          c2Qg    �                  �                  local cmp = require('cmp')   cmp.setup({       snippet = {   :        -- REQUIRED by nvim-cmp. get rid of it once we can           expand = function(args)   0            vim.fn["vsnip#anonymous"](args.body)           end,       },       mapping = {   8        -- Tab immediately completes. C-n/C-p to select.   ;        ['<Tab>'] = cmp.mapping.confirm({ select = true }),   N        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),   M        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' })       },   "    sources = cmp.config.sources({   U        -- TODO: currently snippets from lsp end up getting prioritized -- stop that!           { name = 'nvim_lsp' },       }, {           { name = 'path' },       }),       experimental = {           ghost_text = true,       },   })       -- Enable completing paths in :   cmp.setup.cmdline(':', {   "    sources = cmp.config.sources({           { name = 'path' }       })   })5��                                 ~            �                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             c;qa    �                  �              5��                                                  �                                                  �                                              �                      +                 +       �        '              P   '              P       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c2P�    �   
            =        -- ['<Tab>'] = cmp.mapping.confirm({ select = true })5��    
                     (                     5��