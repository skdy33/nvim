set hlsearch " 검색어 하이라이팅                                                                     
set nu " 줄번호                                                                                      
set autoindent " 자동 들여쓰기                                                                       
set scrolloff=2                                                                                      
set wildmode=longest,list                                                                            
set ts=4 "tag select                                                                                 
set sts=4 "st select                                                                                 
set sw=1 " 스크롤바 너비                                                                             
set autowrite " 다른 파일로 넘어갈 때 자동 저장                                                      

set pastetoggle=<F2>



set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴                                 
set cindent " C언어 자동 들여쓰기                                                                    
set bs=eol,start,indent                                                                              
set history=256                                                                                      
set laststatus=2 " 상태바 표시 항상                                                                  
" set paste " 붙여넣기 계단현상 없애기                                                                
set shiftwidth=4 " 자동 들여쓰기 너비 설정                                                           
set showmatch " 일치하는 괄호 하이라이팅                                                             
set smartcase " 검색시 대소문자 구별                                                                 
set smarttab                                                                                         
set smartindent                                                                                      
set softtabstop=4                                                                                    
set tabstop=4                                                                                        
set ruler " 현재 커서 위치 표시                                                                      
set incsearch                                                                                        
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\                                                      
" 파일 인코딩을 한국어로                                                                             
if $LANG[0]=='k' && $LANG[1]=='o'                                                                    
set fileencoding=korea                                                                               
endif                                                                                                
" 구문 강조 사용                                                                                     
if has("syntax")                                                                                     
 syntax on                                                                                           
endif                                                                                                
" 컬러 스킴 사용                                                                                     
" Vim color file                                                                                     


call plug#begin('~/.local/share/nvim/plugged')                                                       
Plug 'morhetz/gruvbox'                                                                               
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()                                                                                      
colorscheme gruvbox                                                                                  
set background=dark

" CtrlP 플러그인 추가
set runtimepath^=~/.local/share/nvim/bundle/ctrlp.vim

let mapleader=","
map <leader>s :source ~/.config/nvim/init.vim<cr>
" 기본 무시 설정

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
" 가장 가까운 .git 디렉토리를 cwd(현재 작업 디렉토리)로 사용
" " 버전 관리를 사용하는 프로젝트를 할 때 꽤 적절하다.
" " .svn, .hg, .bzr도 지원한다.
let g:ctrlp_working_path_mode = 'r'

" 단축키를 리더 키로 대체
nmap <leader>p :CtrlP<cr>

" 여러 모드를 위한 단축키
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" python autocomplete


let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"To avoid conflict snippets
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1


nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>

" NERDTree ON 단축키
map <Leader>nt :NERDTree<CR>
